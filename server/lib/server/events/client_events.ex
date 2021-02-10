defmodule Server.Events.ClientEvents do
  use EnumType
  alias Server.Events.ServerEvents

  defmodule AcceptInvite do
    @enforce_keys [:theirId, :myName, :encryptedChatSecretKey]
    defstruct [:theirId, :myName, :encryptedChatSecretKey]
  end

  defmodule AckLastMessageTimestamp do
    @enforce_keys [:lastMessageTimestamp]
    defstruct [:lastMessageTimestamp]
  end

  defmodule SendChat do
    @enforce_keys [:contactId, :encrypted, :iv, :timestamp]
    defstruct [:contactId, :encrypted, :iv, :timestamp]
  end

  def handle(event, payload, socket) do
    user_id = socket.assigns[:user_id]

    with {:ok, client_event} <- parse_client_event(event, payload) do
      case client_event do
        %AcceptInvite{
          theirId: their_id,
          myName: my_name,
          encryptedChatSecretKey: encrypted_chat_secret_key
        } ->
          ServerEvents.insert(their_id, %ServerEvents.InviteAccepted{
            id: user_id,
            name: my_name,
            encryptedChatSecretKey: encrypted_chat_secret_key,
            timestamp: System.os_time(:millisecond)
          })

        %AckLastMessageTimestamp{lastMessageTimestamp: last_message_timestamp} ->
          ServerEvents.delete(user_id, last_message_timestamp)

        %SendChat{contactId: contact_id, encrypted: encrypted, iv: iv, timestamp: timestamp} ->
          ServerEvents.insert(contact_id, %ServerEvents.ReceiveChat{
            contactId: user_id,
            encrypted: encrypted,
            iv: iv,
            timestamp: timestamp
          })
      end

      :ok
    end
  end

  defp parse_client_event(event, payload) do
    case event do
      "ACCEPT_INVITE" ->
        {:ok,
         %AcceptInvite{
           theirId: payload["theirId"],
           myName: payload["myName"],
           encryptedChatSecretKey: payload["encryptedChatSecretKey"]
         }}

      "ACK_LAST_MESSAGE_TIMESTAMP" ->
        {:ok, %AckLastMessageTimestamp{lastMessageTimestamp: payload["lastMessageTimestamp"]}}

      "SEND_CHAT" ->
        {
          :ok,
          %SendChat{
            contactId: payload["contactId"],
            encrypted: payload["encrypted"],
            iv: payload["iv"],
            timestamp: payload["timestamp"]
          }
        }

      _ ->
        {:error, "Unrecognised client event: #{event} with payload: #{Poison.encode!(payload)}"}
    end
  end
end
