import 'package:phoenix_socket/phoenix_socket.dart';
import 'package:stealth_chat/socket/client/accept_invite_event.dart';
import 'package:stealth_chat/socket/client/ack_last_message_timestamp_channel.dart';
import 'package:stealth_chat/util/logging.dart';

class ClientEvents {
  final AcceptInviteEvent acceptInvite;
  final AckLastMessageTimestampEvent ackLastMessageTimestamp;

  ClientEvents(PhoenixChannel channel)
      : this.acceptInvite = AcceptInviteEvent(channel),
        this.ackLastMessageTimestamp = AckLastMessageTimestampEvent(channel);
}

typedef ToJson<T> = Map<String, dynamic> Function(T t);

abstract class ClientEvent<T> {
  final PhoenixChannel _channel;
  final String _event;
  final ToJson<T> _toJson;

  ClientEvent(PhoenixChannel channel, String event, ToJson<T> toJson)
      : this._channel = channel,
        this._event = event,
        this._toJson = toJson;

  Push push(T t) {
    final payload = _toJson(t);
    logDebug('Client event: $_event payload: $payload');
    return _channel.push(_event, payload);
  }
}
