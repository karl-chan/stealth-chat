import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:phoenix_socket/phoenix_socket.dart';
import 'package:stealth_chat/socket/server/server_events.dart';

part 'invite_accepted_event.freezed.dart';
part 'invite_accepted_event.g.dart';

class InviteAcceptedEvent extends ServerEvent<InviteAcceptedMessage> {
  InviteAcceptedEvent(Stream<Message> messages)
      : super(messages, 'INVITE_ACCEPTED',
            (data) => InviteAcceptedMessage.fromJson(data));
}

@freezed
abstract class InviteAcceptedMessage with _$InviteAcceptedMessage {
  const factory InviteAcceptedMessage({String message}) =
      _InviteAcceptedMessage;

  factory InviteAcceptedMessage.fromJson(Map<String, dynamic> json) =>
      _$InviteAcceptedMessageFromJson(json);
}
