defmodule ServerWeb.UserChannel do
  use ServerWeb, :channel

  alias Server
  alias Server.Events.ClientEvents
  alias Server.Events.ServerEvents
  require Logger

  @impl true
  def join(
        "user:" <> user_id,
        %{"last_message_timestamp" => last_message_timestamp, "contact_ids" => contact_ids},
        socket
      ) do
    if authorize?(user_id, socket) do
      socket = assign(socket, :contact_ids, contact_ids)
      send(self(), {:after_join, last_message_timestamp})
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
    {res, socket} = ClientEvents.handle(event, payload, socket)
    {:reply, res, socket}
  end

  @impl true
  def handle_info({:after_join, last_message_timestamp}, socket) do
    user_id = socket.assigns.user_id
    contact_ids = socket.assigns.contact_ids

    stream_server_events(user_id, last_message_timestamp, socket)
    broadcast_online(user_id, contact_ids)

    {:noreply, socket}
  end

  @impl true
  def terminate(_reason, socket) do
    Logger.info("User terminating: #{socket.assigns.user_id}")
    broadcast_offline(socket.assigns.user_id, socket.assigns.contact_ids)
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
  end

  defp broadcast_online(user_id, contact_ids) do
    broadcast_status(user_id, contact_ids, true)
  end

  defp broadcast_offline(user_id, contact_ids) do
    broadcast_status(user_id, contact_ids, false)
  end

  defp broadcast_status(user_id, contact_ids, is_online) do
    spawn(fn ->
      contact_ids
      |> Enum.each(fn contact_id ->
        ServerEvents.insert(contact_id, %ServerEvents.ReceiveStatus{
          contactId: user_id,
          online: is_online,
          lastSeen: System.os_time(:millisecond)
        })
      end)
    end)
  end

  defp authorize?(user_id, socket) do
    user_id == socket.assigns.user_id
  end
end
