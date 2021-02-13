import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:phoenix_socket/phoenix_socket.dart';
import 'package:stealth_chat/util/socket/client/client_events.dart';

part 'send_status_event.freezed.dart';
part 'send_status_event.g.dart';

class SendStatusEvent extends ClientEvent<SendStatusMessage> {
  SendStatusEvent(PhoenixChannel channel)
      : super(channel, 'SEND_STATUS', (message) => message.toJson());
}

@freezed
abstract class SendStatusMessage with _$SendStatusMessage {
  const factory SendStatusMessage(
      {List<String> contactIds,
      bool online,
      int lastSeen}) = _SendStatusMessage;

  factory SendStatusMessage.fromJson(Map<String, dynamic> json) =>
      _$SendStatusMessageFromJson(json);
}
