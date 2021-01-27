defmodule Server.Message do
  use EnumType

  @coll "messages"

  defenum Events do
    # outgoing events
    value(ERROR, "ERROR")
    value(INVITE_ACCEPTED, "INVITE_ACCEPTED")

    # incoming events
    value(ACCEPT_INVITE, "ACCEPT_INVITE")
    value(ACK_LAST_MESSAGE_TIMESTAMP, "ACK_LAST_MESSAGE_TIMESTAMP")

    default(ERROR)
  end

  def insert(user_id, event, data) do
    Mongo.insert_one(:mongo, @coll, %{
      "userId" => user_id,
      "event" => event.value,
      "payload" => %{
        "data" => data,
        "timestamp" => System.os_time(:nanosecond)
      }
    })
  end

  def find(user_id, last_message_timestamp) do
    Mongo.find(:mongo, @coll, %{
      "userId" => user_id,
      "payload.timestamp" => %{"$gt" => last_message_timestamp}
    })
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

  @dialyzer {:nowarn_function, create_index: 0}
  def create_index() do
    Mongo.create_indexes(:mongo, @coll, [
      [
        key: ["payload.timestamp": 1],
        name: "timestamp_key",
        unique: true
      ]
    ])
  end
end
