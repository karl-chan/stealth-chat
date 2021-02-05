defmodule Server.Events.ClientEvents do
  use EnumType
  alias Server.Events.ServerEvents

  defenum ClientEvent do
    value(ACCEPT_INVITE, "ACCEPT_INVITE")
    value(ACK_LAST_MESSAGE_TIMESTAMP, "ACK_LAST_MESSAGE_TIMESTAMP")
  end

  def handle(client_event, payload, socket) do
    user_id = socket.assigns[:user_id]

    case {ClientEvent.from(client_event), payload} do
      {ClientEvent.ACCEPT_INVITE, %{"id" => id, "name" => name}} ->
        ServerEvents.insert(id, ServerEvent.INVITE_ACCEPTED, %{
          "id" => user_id,
          "name" => name
        })

        :ok

      {ClientEvent.ACK_LAST_MESSAGE_TIMESTAMP,
       %{"last_message_timestamp" => last_message_timestamp}} ->
        ServerEvents.delete(user_id, last_message_timestamp)

        :ok

      _ ->
        error_message =
          "Unrecognised client event: #{client_event} with payload: #{Poison.encode!(payload)}"

        {:error, error_message}
    end
  end
end
