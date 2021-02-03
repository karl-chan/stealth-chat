import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:phoenix_socket/phoenix_socket.dart';
import 'package:stealth_chat/socket/server/server_events.dart';

part 'error_event.freezed.dart';
part 'error_event.g.dart';

class ErrorEvent extends ServerEvent<ErrorMessage> {
  ErrorEvent(Stream<Message> messages)
      : super(messages, 'ERROR', (data) => ErrorMessage.fromJson(data));
}

@freezed
abstract class ErrorMessage with _$ErrorMessage {
  const factory ErrorMessage({String message}) = _ErrorMessage;

  factory ErrorMessage.fromJson(Map<String, dynamic> json) =>
      _$ErrorMessageFromJson(json);
}
