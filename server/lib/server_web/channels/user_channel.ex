defmodule ServerWeb.UserChannel do
  alias Server.Message
  alias Server.Message.Events
  import Phoenix.Channel

  def join("user:" <> user_id, %{"last_message_timestamp" => last_message_timestamp}, socket) do
    delete_old_messages(user_id, last_message_timestamp)
    stream_existing_messages(user_id, last_message_timestamp, socket)
    stream_new_messages(user_id, last_message_timestamp, socket)
    {:ok, socket}
  end

  def handle_in(event, payload, socket) do
    user_id = socket.assigns[:user_id]

    case {event, payload} do
      {"accept_invite", %{"name" => name}} ->
        Message.insert(user_id, Events.INVITE_ACCEPTED, %{
          "id" => user_id,
          "name" => name
        })

      _ ->
        Message.insert(user_id, Events.ERROR, %{
          "message" => "Unrecognised combination of event: #{event} and payload: #{payload}"
        })

        nil
    end
  end

  defp stream_existing_messages(user_id, last_message_timestamp, socket) do
    Message.find(user_id, last_message_timestamp)
    |> Enum.each(fn doc -> push(socket, doc["event"], doc["payload"]) end)
  end

  defp stream_new_messages(user_id, last_message_timestamp, socket) do
    Message.stream(user_id, last_message_timestamp)
    |> Enum.filter(fn change -> change["operationType"] == "insert" end)
    |> Enum.map(fn change -> change["fullDocument"] end)
    |> Enum.each(fn doc -> push(socket, doc["event"], doc["payload"]) end)
  end

  defp delete_old_messages(user_id, last_message_timestamp) do
    Message.delete(user_id, last_message_timestamp)
  end
end
