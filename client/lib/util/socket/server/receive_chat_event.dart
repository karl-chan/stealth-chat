import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:phoenix_socket/phoenix_socket.dart';
import 'package:stealth_chat/globals.dart';
import 'package:stealth_chat/util/db/db.dart';
import 'package:stealth_chat/util/security/aes.dart';
import 'package:stealth_chat/util/security/keys.dart';
import 'package:stealth_chat/util/socket/server/server_events.dart';

part 'receive_chat_event.freezed.dart';
part 'receive_chat_event.g.dart';

class ReceiveChatEvent extends ServerEvent<ReceiveChatMessage> {
  ReceiveChatEvent(Stream<Message> messages, Globals globals)
      : super(messages, 'RECEIVE_CHAT',
            (data) => ReceiveChatMessage.fromJson(data),
            callback: (message) async {
          Contact contact =
              await globals.db.contacts.getContact(message.contactId);
          String messageText = Aes.decrypt(
              AesMessage(encrypted: message.encrypted, iv: message.iv),
              Keys(secretKey: contact.chatSecretKey));
          await globals.db.chatMessages.insertMessage(
              message.contactId,
              false,
              messageText,
              DateTime.fromMillisecondsSinceEpoch(message.timestamp));
        });
}

@freezed
abstract class ReceiveChatMessage with _$ReceiveChatMessage {
  const factory ReceiveChatMessage(
      {String contactId,
      String encrypted,
      String iv,
      int timestamp}) = _ReceiveChatMessage;

  factory ReceiveChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ReceiveChatMessageFromJson(json);
}
