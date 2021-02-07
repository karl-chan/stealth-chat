import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:phoenix_socket/phoenix_socket.dart';
import 'package:stealth_chat/globals.dart';
import 'package:stealth_chat/util/socket/server/server_events.dart';

part 'invite_accepted_event.freezed.dart';
part 'invite_accepted_event.g.dart';

class InviteAcceptedEvent extends ServerEvent<InviteAcceptedMessage> {
  InviteAcceptedEvent(Stream<Message> messages, Globals globals)
      : super(messages, 'NOTIFICATION',
            (data) => InviteAcceptedMessage.fromJson(data),
            callback: (message) => globals.db.notifications.insert(
                title: '${message.name} accepted your invite!',
                body: 'You can now chat with ${message.name}!'));
}

@freezed
abstract class InviteAcceptedMessage with _$InviteAcceptedMessage {
  const factory InviteAcceptedMessage({String id, String name}) =
      _InviteAcceptedMessage;

  factory InviteAcceptedMessage.fromJson(Map<String, dynamic> json) =>
      _$InviteAcceptedMessageFromJson(json);
}
