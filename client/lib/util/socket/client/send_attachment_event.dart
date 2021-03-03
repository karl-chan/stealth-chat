import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:phoenix_socket/phoenix_socket.dart';
import 'package:stealth_chat/util/socket/client/client_events.dart';

part 'send_attachment_event.freezed.dart';
part 'send_attachment_event.g.dart';

class SendAttachmentEvent extends ClientEvent<SendAttachmentMessage> {
  SendAttachmentEvent(PhoenixChannel channel)
      : super(channel, 'SEND_ATTACHMENT', (message) => message.toJson());
}

@freezed
abstract class SendAttachmentMessage with _$SendAttachmentMessage {
  const factory SendAttachmentMessage(
      {String contactId,
      int timestamp,
      String encrypted,
      String iv}) = _SendAttachmentMessage;

  factory SendAttachmentMessage.fromJson(Map<String, dynamic> json) =>
      _$SendAttachmentMessageFromJson(json);
}
