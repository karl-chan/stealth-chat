defmodule Server.Events.ServerEvents do
  use EnumType
  require Logger

  @coll "messages"

  defmodule Error do
    @derive [Poison.Encoder]
    @enforce_keys [:message]
    defstruct [:message]
  end

  defmodule Heartbeat do
    @derive [Poison.Encoder]
    @enforce_keys [:message]
    defstruct [:message]
  end

  defmodule InviteAccepted do
    @derive [Poison.Encoder]
    @enforce_keys [:id, :name]
    defstruct [:id, :name]
  end

  def insert(user_id, server_event) do
    event = server_event.__struct__ |> Module.split() |> List.last() |> Recase.to_constant()
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