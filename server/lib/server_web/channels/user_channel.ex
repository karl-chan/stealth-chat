defmodule ServerWeb.UserChannel do
  use ServerWeb, :channel

  alias Server
  alias Server.Events.ClientEvents
  alias Server.Events.ServerEvents
  require Logger

  @impl true
  def join("user:" <> user_id, %{"last_message_timestamp" => last_message_timestamp}, socket) do
    if user_id == socket.assigns.user_id do
      stream_server_events(user_id, last_message_timestamp, socket)
      Logger.info("User connected to channel: #{user_id}")
      {:ok, socket}
    else
      {:error,
       %{
         reason: "User: #{socket.assigns.user_id} is not allowed to join channel user: #{user_id}"
       }}
    end
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  @impl true
  def handle_in(client_event, payload, socket) do
    Logger.info("Received client event: #{client_event}")
    res = ClientEvents.handle(client_event, payload, socket)
    {:reply, res, socket}
  end

  defp stream_server_events(user_id, last_message_timestamp, socket) do
    # existing messages
    existing_messages = ServerEvents.find(user_id, last_message_timestamp)

    Enum.each(existing_messages, fn doc ->
      Logger.debug("Existing server event: #{Poison.encode!(doc)}")
      push(socket, doc["event"], doc["payload"])
    end)

    # listen for new messages
    spawn(fn ->
      ServerEvents.stream(user_id, last_message_timestamp)
      |> Enum.map(fn change ->
        Logger.debug("Change stream event: #{Poison.encode!(change)}")
        change
      end)
      |> Enum.filter(fn change -> change["operationType"] == "insert" end)
      |> Enum.map(fn change -> change["fullDocument"] end)
      |> Enum.each(fn doc -> push(socket, doc["event"], doc["payload"]) end)
    end)
  end
end
