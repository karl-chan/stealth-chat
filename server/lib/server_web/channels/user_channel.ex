defmodule ServerWeb.UserChannel do
  use ServerWeb, :channel

  alias Server
  alias Server.Events.ClientEvents
  alias Server.Events.ServerEvents
  require Logger

  @impl true
  def join("user:" <> user_id, %{"last_message_timestamp" => last_message_timestamp}, socket) do
    if authorize?(user_id, socket) do
      send(self(), {:after_join, user_id, last_message_timestamp})
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
  def handle_in(event, payload, socket) do
    res = ClientEvents.handle(event, payload, socket)
    {:reply, res, socket}
  end

  @impl true
  def handle_info({:after_join, user_id, last_message_timestamp}, socket) do
    stream_server_events(user_id, last_message_timestamp, socket)
    {:noreply, socket}
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
      |> Enum.each(fn change ->
        if change["operationType"] == "insert" do
          doc = change["fullDocument"]
          event = doc["event"]
          payload = doc["payload"]

          Logger.debug(
            "Change stream event for #{user_id}: #{Poison.encode!(event)} payload: #{
              Poison.encode!(payload)
            }"
          )

          push(socket, event, payload)
        end
      end)
    end)

    # send heartbeat
    ServerEvents.insert(user_id, %ServerEvents.Heartbeat{message: "heartbeat"})
  end

  defp authorize?(user_id, socket) do
    user_id == socket.assigns.user_id
  end
end
