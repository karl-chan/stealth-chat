import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:phoenix_socket/phoenix_socket.dart';
import 'package:stealth_chat/util/socket/client/client_events.dart';

part 'send_chat_update_event.freezed.dart';
part 'send_chat_update_event.g.dart';

class SendChatUpdateEvent extends ClientEvent<SendChatUpdateMessage> {
  SendChatUpdateEvent(PhoenixChannel channel)
      : super(channel, 'SEND_CHAT_UPDATE', (message) => message.toJson());
}

@freezed
abstract class SendChatUpdateMessage with _$SendChatUpdateMessage {
  const factory SendChatUpdateMessage(
      {String contactId,
      int timestamp,
      String event,
      int eventTimestamp}) = _SendChatUpdateMessage;

  factory SendChatUpdateMessage.fromJson(Map<String, dynamic> json) =>
      _$SendChatUpdateMessageFromJson(json);
}
