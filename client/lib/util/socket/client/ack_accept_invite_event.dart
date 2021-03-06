import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:phoenix_socket/phoenix_socket.dart';
import 'package:stealth_chat/util/socket/client/client_events.dart';

part 'ack_accept_invite_event.freezed.dart';
part 'ack_accept_invite_event.g.dart';

class AckAcceptInviteEvent extends ClientEvent<AckAcceptInviteMessage> {
  AckAcceptInviteEvent(PhoenixChannel channel)
      : super(channel, 'ACK_ACCEPT_INVITE', (message) => message.toJson());
}

@freezed
abstract class AckAcceptInviteMessage with _$AckAcceptInviteMessage {
  const factory AckAcceptInviteMessage({String contactId}) =
      _AckAcceptInviteMessage;

  factory AckAcceptInviteMessage.fromJson(Map<String, dynamic> json) =>
      _$AckAcceptInviteMessageFromJson(json);
}
