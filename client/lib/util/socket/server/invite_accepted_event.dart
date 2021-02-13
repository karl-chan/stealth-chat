import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:phoenix_socket/phoenix_socket.dart';
import 'package:stealth_chat/globals.dart';
import 'package:stealth_chat/util/security/rsa.dart';
import 'package:stealth_chat/util/socket/server/server_events.dart';

part 'invite_accepted_event.freezed.dart';
part 'invite_accepted_event.g.dart';

class InviteAcceptedEvent extends ServerEvent<InviteAcceptedMessage> {
  InviteAcceptedEvent(Stream<Message> messages, Globals globals)
      : super(messages, 'INVITE_ACCEPTED',
            (data) => InviteAcceptedMessage.fromJson(data),
            callback: (message) async {
          await globals.db.notifications.insert(
              '${message.name} accepted your invite!',
              '',
              'You can now chat with ${message.name}!',
              message.timestamp);
          await globals.db.contacts.addContact(
              message.id,
              message.name,
              Rsa.decrypt(message.encryptedChatSecretKey, globals.user.keys),
              DateTime.fromMillisecondsSinceEpoch(message.timestamp));
        });
}

@freezed
abstract class InviteAcceptedMessage with _$InviteAcceptedMessage {
  const factory InviteAcceptedMessage(
      {String id,
      String name,
      String encryptedChatSecretKey,
      int timestamp}) = _InviteAcceptedMessage;

  factory InviteAcceptedMessage.fromJson(Map<String, dynamic> json) =>
      _$InviteAcceptedMessageFromJson(json);
}
