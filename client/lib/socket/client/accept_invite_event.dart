import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:phoenix_socket/phoenix_socket.dart';
import 'package:stealth_chat/socket/client/client_events.dart';

part 'accept_invite_event.freezed.dart';
part 'accept_invite_event.g.dart';

class AcceptInviteEvent extends ClientEvent<AcceptInviteMessage> {
  AcceptInviteEvent(PhoenixChannel channel)
      : super(channel, 'ACCEPT_INVITE', (message) => message.toJson());
}

@freezed
abstract class AcceptInviteMessage with _$AcceptInviteMessage {
  const factory AcceptInviteMessage({String id, String name}) =
      _AcceptInviteMessage;

  factory AcceptInviteMessage.fromJson(Map<String, dynamic> json) =>
      _$AcceptInviteMessageFromJson(json);
}
