defmodule Server.Events.ClientEvents do
  use EnumType
  alias Server.Events.ServerEvents
  alias Phoenix.Socket

  defmodule AcceptInvite do
    @enforce_keys [:theirId, :myName, :encryptedChatSecretKey, :timestamp]
    defstruct [:theirId, :myName, :encryptedChatSecretKey, :timestamp]
  end

  defmodule AckAcceptInvite do
    @enforce_keys [:contactId]
    defstruct [:contactId]
  end

  defmodule AckLastMessageTimestamp do
    @enforce_keys [:lastMessageTimestamp]
    defstruct [:lastMessageTimestamp]
  end

  defmodule DeleteContacts do
    @enforce_keys [:contactIds]
    defstruct [:contactIds]
  end

  defmodule SendChat do
    @enforce_keys [:contactId, :encrypted, :iv, :timestamp]
    defstruct [:contactId, :encrypted, :iv, :timestamp]
  end

  defmodule SendChatUpdate do
    @enforce_keys [:contactId, :timestamp, :event, :eventTimestamp]
    defstruct [:contactId, :timestamp, :event, :eventTimestamp]
  end

  defmodule SendAttachment do
    @enforce_keys [:contactId, :timestamp, :encrypted, :iv]
    defstruct [:contactId, :timestamp, :encrypted, :iv]
  end

  def handle(event, payload, socket) do
    with {:ok, client_event} <- parse_client_event(event, payload) do
      handle_client_event(client_event, socket)
      socket = maybe_assign_socket(client_event, socket)
      {:ok, socket}
    end
  end

  defp handle_client_event(client_event, socket) do
    user_id = socket.assigns.user_id

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

        ServerEvents.insert(their_id, %ServerEvents.ReceiveStatus{
          contactId: user_id,
          online: true,
          lastSeen: System.os_time(:millisecond)
        })

      %AckAcceptInvite{contactId: contact_id} ->
        ServerEvents.insert(contact_id, %ServerEvents.ReceiveStatus{
          contactId: user_id,
          online: true,
          lastSeen: System.os_time(:millisecond)
        })

      %AckLastMessageTimestamp{lastMessageTimestamp: last_message_timestamp} ->
        ServerEvents.delete(user_id, last_message_timestamp)

      %DeleteContacts{contactIds: contact_ids} ->
        Enum.each(contact_ids, fn contact_id ->
          ServerEvents.insert(contact_id, %ServerEvents.ArchiveContact{
            contactId: user_id
          })
        end)

      %SendChat{
        contactId: contact_id,
        encrypted: encrypted,
        iv: iv,
        timestamp: timestamp
      } ->
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

        ServerEvents.send_notification(user_id)

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

      %SendAttachment{
        contactId: contact_id,
        timestamp: timestamp,
        encrypted: encrypted,
        iv: iv
      } ->
        ServerEvents.insert(contact_id, %ServerEvents.ReceiveAttachment{
          contactId: user_id,
          timestamp: timestamp,
          encrypted: encrypted,
          iv: iv
        })
    end
  end

  defp maybe_assign_socket(client_event, socket) do
    contact_ids = socket.assigns.contact_ids

    case client_event do
      %AcceptInvite{theirId: their_id} ->
        Socket.assign(socket, :contact_ids, [their_id | contact_ids])

      %AckAcceptInvite{contactId: contact_id} ->
        Socket.assign(socket, :contact_ids, [contact_id | contact_ids])

      _ ->
        socket
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

      "ACK_ACCEPT_INVITE" ->
        {
          :ok,
          %AckAcceptInvite{
            contactId: payload["contactId"]
          }
        }

      "ACK_LAST_MESSAGE_TIMESTAMP" ->
        {:ok, %AckLastMessageTimestamp{lastMessageTimestamp: payload["lastMessageTimestamp"]}}

      "DELETE_CONTACTS" ->
        {:ok, %DeleteContacts{contactIds: payload["contactIds"]}}

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

      "SEND_ATTACHMENT" ->
        {
          :ok,
          %SendAttachment{
            contactId: payload["contactId"],
            timestamp: payload["timestamp"],
            encrypted: payload["encrypted"],
            iv: payload["iv"]
          }
        }

      _ ->
        {:error, "Unrecognised client event: #{event} with payload: #{Poison.encode!(payload)}"}
    end
  end
end
