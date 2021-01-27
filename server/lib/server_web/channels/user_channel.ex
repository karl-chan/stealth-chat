defmodule ServerWeb.UserChannel do
  alias Server.Message
  alias Server.Message.ClientEvent
  alias Server.Message.ServerEvent
  import Phoenix.Channel
  require Logger

  def join("user:" <> user_id, %{"last_message_timestamp" => last_message_timestamp}, socket) do
    stream_messages(user_id, last_message_timestamp, socket)
    {:ok, socket}
  end

  def handle_in(client_event, payload, socket) do
    Logger.info("Received client event: " <> client_event)
    user_id = socket.assigns[:user_id]

    case {ClientEvent.from(client_event), payload} do
      {ClientEvent.ACCEPT_INVITE, %{"id" => id, "name" => name}} ->
        Message.insert(id, ServerEvent.INVITE_ACCEPTED, %{
          "id" => user_id,
          "name" => name
        })

        {:reply, :ok, socket}

      _ ->
        error_message = "Unrecognised client event: #{client_event} with payload: #{payload}"
        {:reply, {:error, error_message}, socket}
    end
  end

  defp stream_messages(user_id, last_message_timestamp, socket) do
    # existing messages
    Message.find(user_id, last_message_timestamp)
    |> Enum.each(fn doc -> push(socket, doc["event"], doc["payload"]) end)

    # listen for new messages
    Message.stream(user_id, last_message_timestamp)
    |> Enum.filter(fn change -> change["operationType"] == "insert" end)
    |> Enum.map(fn change -> change["fullDocument"] end)
    |> Enum.each(fn doc -> push(socket, doc["event"], doc["payload"]) end)
  end
end
