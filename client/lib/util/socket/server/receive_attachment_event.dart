import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:phoenix_socket/phoenix_socket.dart';
import 'package:stealth_chat/chat/attachment/attachment.dart';
import 'package:stealth_chat/globals.dart';
import 'package:stealth_chat/util/db/db.dart';
import 'package:stealth_chat/util/security/aes.dart';
import 'package:stealth_chat/util/security/keys.dart';
import 'package:stealth_chat/util/socket/server/server_events.dart';

part 'receive_attachment_event.freezed.dart';
part 'receive_attachment_event.g.dart';

class ReceiveAttachmentEvent extends ServerEvent<ReceiveAttachmentMessage> {
  ReceiveAttachmentEvent(Stream<Message> messages, Globals globals)
      : super(messages, 'RECEIVE_ATTACHMENT',
            (data) => ReceiveAttachmentMessage.fromJson(data),
            callback: (message) async {
          Contact contact =
              await globals.db.contacts.getContact(message.contactId);

          Attachment attachment = await Attachment.decode(
              AesMessage(encrypted: message.encrypted, iv: message.iv),
              Keys(secretKey: contact.chatSecretKey));

          await globals.db.chatMessages.insertAttachment(
              message.contactId,
              false,
              DateTime.fromMillisecondsSinceEpoch(message.timestamp),
              attachment);
        });
}

@freezed
abstract class ReceiveAttachmentMessage with _$ReceiveAttachmentMessage {
  const factory ReceiveAttachmentMessage(
      {String contactId,
      int timestamp,
      String encrypted,
      String iv}) = _ReceiveAttachmentMessage;

  factory ReceiveAttachmentMessage.fromJson(Map<String, dynamic> json) =>
      _$ReceiveAttachmentMessageFromJson(json);
}
