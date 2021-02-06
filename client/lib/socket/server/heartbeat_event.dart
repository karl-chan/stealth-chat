import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:phoenix_socket/phoenix_socket.dart';
import 'package:stealth_chat/socket/server/server_events.dart';

part 'heartbeat_event.freezed.dart';
part 'heartbeat_event.g.dart';

class HeartbeatEvent extends ServerEvent<HeartbeatMessage> {
  HeartbeatEvent(Stream<Message> messages)
      : super(messages, 'HEARTBEAT', (data) => HeartbeatMessage.fromJson(data));
}

@freezed
abstract class HeartbeatMessage with _$HeartbeatMessage {
  const factory HeartbeatMessage({String message}) = _HeartbeatMessage;

  factory HeartbeatMessage.fromJson(Map<String, dynamic> json) =>
      _$HeartbeatMessageFromJson(json);
}
