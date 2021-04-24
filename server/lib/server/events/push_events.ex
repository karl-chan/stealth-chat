defmodule Server.Events.PushEvents do
  alias Server.Caches.UserCache

  defmodule NewMessageNotification do
    @derive [Poison.Encoder]
    defstruct []
  end

  def push(user_id, push_event) do
    case push_event do
      %NewMessageNotification{} -> push_msg(user_id, "New content is available!", push_event)
    end
  end

  defp push_msg(user_id, msg, push_event) do
    {:ok, fcm_token} = UserCache.get_fcm_token(user_id)

    event = get_event_name(push_event)
    payload = push_event |> Map.from_struct()

    notification = %{
      "title" => "Dictionary",
      "body" => msg
    }

    data = %{
      "event" => event,
      "payload" => payload
    }

    n = Pigeon.FCM.Notification.new(fcm_token, notification, data)
    Pigeon.FCM.push(n)
  end

  defp get_event_name(server_event) do
    server_event.__struct__ |> Module.split() |> List.last() |> Recase.to_constant()
  end
end
