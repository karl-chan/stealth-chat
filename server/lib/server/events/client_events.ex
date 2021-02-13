defmodule Server.Events.ClientEvents do
  use EnumType
  alias Server.Events.ServerEvents

  defmodule AcceptInvite do
    @enforce_keys [:theirId, :myName, :encryptedChatSecretKey, :timestamp]
    defstruct [:theirId, :myName, :encryptedChatSecretKey, :timestamp]
  end

  defmodule AckLastMessageTimestamp do
    @enforce_keys [:lastMessageTimestamp]
    defstruct [:lastMessageTimestamp]
  end

  defmodule SendChat do
    @enforce_keys [:contactId, :encrypted, :iv, :timestamp]
    defstruct [:contactId, :encrypted, :iv, :timestamp]
  end

  defmodule SendChatUpdate do
    @enforce_keys [:contactId, :timestamp, :event, :eventTimestamp]
    defstruct [:contactId, :timestamp, :event, :eventTimestamp]
  end

  defmodule SendStatus do
    @enforce_keys [:contactIds, :online, :lastSeen]
    defstruct [:contactIds, :online, :lastSeen]
  end

  def handle(event, payload, socket) do
    user_id = socket.assigns[:user_id]

    with {:ok, client_event} <- parse_client_event(event, payload) do
      case client_event do
        %AcceptInvite{
          theirId: their_id,
          myName: my_name,
          encryptedChatSecretKey: encrypted_chat_secret_key,
          timestamp: timestamp
        } ->
          ServerEvents.insert(their_id, %ServerEvents.InviteAccepted{
            id: user_id,
            name: my_name,
            encryptedChatSecretKey: encrypted_chat_secret_key,
            timestamp: timestamp
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

          ServerEvents.insert(user_id, %ServerEvents.ReceiveChatUpdate{
            contactId: contact_id,
            timestamp: timestamp,
            event: "sent",
            eventTimestamp: System.os_time(:millisecond)
          })

        %SendChatUpdate{
          contactId: contact_id,
          timestamp: timestamp,
          event: event,
          eventTimestamp: eventTimestamp
        } ->
          ServerEvents.insert(contact_id, %ServerEvents.ReceiveChatUpdate{
            contactId: user_id,
            timestamp: timestamp,
            event: event,
            eventTimestamp: eventTimestamp
          })

        %SendStatus{
          contactIds: contact_ids,
          online: online,
          lastSeen: last_seen
        } ->
          ServerEvents.invalidateStatus(user_id)

          contact_ids
          |> Enum.each(fn contact_id ->
            ServerEvents.insert(contact_id, %ServerEvents.ReceiveStatus{
              contactId: user_id,
              online: online,
              lastSeen: last_seen
            })
          end)
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
           encryptedChatSecretKey: payload["encryptedChatSecretKey"],
           timestamp: payload["timestamp"]
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

      "SEND_CHAT_UPDATE" ->
        {
          :ok,
          %SendChatUpdate{
            contactId: payload["contactId"],
            timestamp: payload["timestamp"],
            event: payload["event"],
            eventTimestamp: payload["eventTimestamp"]
          }
        }

      "SEND_STATUS" ->
        {
          :ok,
          %SendStatus{
            contactIds: payload["contactIds"],
            online: payload["online"],
            lastSeen: payload["lastSeen"]
          }
        }

      _ ->
        {:error, "Unrecognised client event: #{event} with payload: #{Poison.encode!(payload)}"}
    end
  end
end
