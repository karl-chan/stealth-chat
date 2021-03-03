defmodule Server.Events.ServerEvents do
  use EnumType
  require Logger

  @coll "messages"

  defmodule Error do
    @derive [Poison.Encoder]
    @enforce_keys [:message]
    defstruct [:message]
  end

  defmodule InviteAccepted do
    @derive [Poison.Encoder]
    @enforce_keys [:id, :name, :encryptedChatSecretKey, :timestamp]
    defstruct [:id, :name, :encryptedChatSecretKey, :timestamp]
  end

  defmodule ReceiveChat do
    @derive [Poison.Encoder]
    @enforce_keys [:contactId, :encrypted, :iv, :timestamp]
    defstruct [:contactId, :encrypted, :iv, :timestamp]
  end

  defmodule ReceiveChatUpdate do
    @derive [Poison.Encoder]
    @enforce_keys [:contactId, :timestamp, :event, :eventTimestamp]
    defstruct [:contactId, :timestamp, :event, :eventTimestamp]
  end

  defmodule ReceiveAttachment do
    @derive [Poison.Encoder]
    @enforce_keys [:contactId, :timestamp, :encrypted, :iv]
    defstruct [:contactId, :timestamp, :encrypted, :iv]
  end

  defmodule ReceiveStatus do
    @derive [Poison.Encoder]
    @enforce_keys [:contactId, :online, :lastSeen]
    defstruct [:contactId, :online, :lastSeen]
  end

  def insert(user_id, server_event) do
    event = get_event_name(server_event)
    data = server_event |> Map.from_struct()

    Logger.debug(
      "Inserted message for user: #{user_id} event: #{event} payload: #{Poison.encode!(data)}"
    )

    Mongo.insert_one(:mongo, @coll, %{
      "userId" => user_id,
      "event" => event,
      "payload" => %{
        "data" => data,
        "timestamp" => System.os_time(:nanosecond)
      }
    })
  end

  def find(user_id, last_message_timestamp) do
    Mongo.find(
      :mongo,
      @coll,
      %{
        "userId" => user_id,
        "payload.timestamp" => %{"$gt" => last_message_timestamp}
      },
      projection: %{_id: 0}
    )
    |> Enum.to_list()
  end

  def delete(user_id, last_message_timestamp) do
    Mongo.delete_many(:mongo, @coll, %{
      "userId" => user_id,
      "payload.timestamp" => %{"$lte" => last_message_timestamp}
    })
  end

  def stream(user_id, last_message_timestamp) do
    Mongo.watch_collection(
      :mongo,
      @coll,
      [
        %{
          "$match" => %{
            "fullDocument.userId" => user_id,
            "fullDocument.payload.timestamp" => %{"$gt" => last_message_timestamp}
          }
        }
      ],
      fn _resume_token -> nil end,
      full_document: "updateLookup"
    )
  end

  def invalidateStatus(user_id) do
    Mongo.delete_many(:mongo, @coll, %{
      "event" => get_event_name(%ReceiveStatus{contactId: nil, online: nil, lastSeen: nil}),
      "payload.data.contactId" => user_id
    })
  end

  @dialyzer {:nowarn_function, create_index: 0}
  def create_index() do
    Logger.debug("Creating index for collection messages...")

    Mongo.create_indexes(:mongo, @coll, [
      [
        key: [userId: 1, "payload.timestamp": 1],
        name: "userId_timestamp_key",
        unique: true
      ],
      [
        key: [event: 1, "payload.data.contactId": 1],
        name: "invalidate_status_key"
      ]
    ])
  end

  defp get_event_name(server_event) do
    server_event.__struct__ |> Module.split() |> List.last() |> Recase.to_constant()
  end
end
