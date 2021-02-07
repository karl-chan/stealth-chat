defmodule Server.Events.ClientEvents do
  use EnumType
  alias Server.Events.ServerEvents
  alias Server.Caches.UserCache

  defmodule AcceptInvite do
    @enforce_keys [:their_id, :my_name]
    defstruct [:their_id, :my_name]
  end

  defmodule AckLastMessageTimestamp do
    @enforce_keys [:last_message_timestamp]
    defstruct [:last_message_timestamp]
  end

  def handle(event, payload, socket) do
    user_id = socket.assigns[:user_id]

    with {:ok, client_event} <- parse_client_event(event, payload) do
      case client_event do
        %AcceptInvite{their_id: their_id, my_name: my_name} ->
          my_id = user_id
          {:ok, my_public_key_pem} = UserCache.get_public_key(my_id)

          ServerEvents.insert(their_id, %ServerEvents.InviteAccepted{
            id: my_id,
            name: my_name,
            publicKey: my_public_key_pem,
            timestamp: System.os_time(:millisecond)
          })

          :ok

        %AckLastMessageTimestamp{last_message_timestamp: last_message_timestamp} ->
          ServerEvents.delete(user_id, last_message_timestamp)

          :ok
      end
    end
  end

  defp parse_client_event(event, payload) do
    case event do
      "ACCEPT_INVITE" ->
        {:ok, %AcceptInvite{their_id: payload["theirId"], my_name: payload["myName"]}}

      "ACK_LAST_MESSAGE_TIMESTAMP" ->
        {:ok, %AckLastMessageTimestamp{last_message_timestamp: payload["lastMessageTimestamp"]}}

      _ ->
        {:error, "Unrecognised client event: #{event} with payload: #{Poison.encode!(payload)}"}
    end
  end
end
