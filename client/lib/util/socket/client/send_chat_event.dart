import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:phoenix_socket/phoenix_socket.dart';
import 'package:stealth_chat/util/socket/client/client_events.dart';

part 'send_chat_event.freezed.dart';
part 'send_chat_event.g.dart';

class SendChatEvent extends ClientEvent<SendChatMessage> {
  SendChatEvent(PhoenixChannel channel)
      : super(channel, 'SEND_CHAT', (message) => message.toJson());
}

@freezed
abstract class SendChatMessage with _$SendChatMessage {
  const factory SendChatMessage({
    String contactId,
    String message,
    int timestamp,
  }) = _SendChatMessage;

  factory SendChatMessage.fromJson(Map<String, dynamic> json) =>
      _$SendChatMessageFromJson(json);
}
