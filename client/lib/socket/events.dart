import 'package:freezed_annotation/freezed_annotation.dart';

part 'events.freezed.dart';
part 'events.g.dart';

class ServerEvent {
  static const ERROR = 'ERROR';
  static const INVITE_ACCEPTED = 'INVITE_ACCEPTED';
}

class ClientEvent {
  static const ACCEPT_INVITE = "ACCEPT_INVITE";
  static const ACK_LAST_MESSAGE_TIMESTAMP = 'ACK_LAST_MESSAGE_TIMESTAMP';
}

@freezed
abstract class AcceptInviteMessage with _$AcceptInviteMessage {
  const factory AcceptInviteMessage({String id, String name}) =
      _AcceptInviteMessage;

  factory AcceptInviteMessage.fromJson(Map<String, dynamic> json) =>
      _$AcceptInviteMessageFromJson(json);
}

@freezed
abstract class AckLastMessageTimestampMessage
    with _$AckLastMessageTimestampMessage {
  const factory AckLastMessageTimestampMessage({int lastMessageTimestamp}) =
      _AckLastMessageTimestampMessage;

  factory AckLastMessageTimestampMessage.fromJson(Map<String, dynamic> json) =>
      _$AckLastMessageTimestampMessageFromJson(json);
}

@freezed
abstract class ErrorMessage with _$ErrorMessage {
  const factory ErrorMessage({String message}) = _ErrorMessage;

  factory ErrorMessage.fromJson(Map<String, dynamic> json) =>
      _$ErrorMessageFromJson(json);
}

@freezed
abstract class InviteAcceptedMessage with _$InviteAcceptedMessage {
  const factory InviteAcceptedMessage() = _InviteAcceptedMessage;

  factory InviteAcceptedMessage.fromJson(Map<String, dynamic> json) =>
      _$InviteAcceptedMessageFromJson(json);
}
