defmodule ServerWeb.UserChannel do
  use ServerWeb, :channel

  alias Server.Message
  alias Server.Message.ClientEvent
  alias Server.Message.ServerEvent
  require Logger

  @impl true
  def join("user:" <> user_id, %{"last_message_timestamp" => last_message_timestamp}, socket) do
    verified_user_id = socket.assigns.user_id

    if authorized?(user_id, verified_user_id) do
      stream_messages(user_id, last_message_timestamp, socket)
      Logger.info("User connected to channel: #{user_id}")
      {:ok, socket}
    else
      {:error,
       %{
         reason: "User: #{verified_user_id} is not allowed to join channel user: #{user_id}"
       }}
    end
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  @impl true
  def handle_in(client_event, payload, socket) do
    Logger.info("Received client event: #{client_event}")
    user_id = socket.assigns[:user_id]

    case {ClientEvent.from(client_event), payload} do
      {ClientEvent.ACCEPT_INVITE, %{"id" => id, "name" => name}} ->
        Message.insert(id, ServerEvent.INVITE_ACCEPTED, %{
          "id" => user_id,
          "name" => name
        })

        {:reply, :ok, socket}

      {ClientEvent.ACK_LAST_MESSAGE_TIMESTAMP,
       %{"last_message_timestamp" => last_message_timestamp}} ->
        Message.delete(user_id, last_message_timestamp)

        {:reply, :ok, socket}

      _ ->
        error_message =
          "Unrecognised client event: #{client_event} with payload: #{Poison.encode!(payload)}"

        {:reply, {:error, error_message}, socket}
    end
  end

  defp stream_messages(user_id, last_message_timestamp, socket) do
    # existing messages
    existing_messages = Message.find(user_id, last_message_timestamp)
    Enum.each(existing_messages, fn doc -> push(socket, doc["event"], doc["payload"]) end)

    # listen for new messages
    spawn(fn ->
      Message.stream(user_id, last_message_timestamp)
      |> Enum.filter(fn change -> change["operationType"] == "insert" end)
      |> Enum.map(fn change -> change["fullDocument"] end)
      |> Enum.each(fn doc -> push(socket, doc["event"], doc["payload"]) end)
    end)
  end

  defp authorized?(user_id, verified_user_id) do
    user_id == verified_user_id
  end
end
