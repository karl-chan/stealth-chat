import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:phoenix_socket/phoenix_socket.dart';
import 'package:stealth_chat/globals.dart';
import 'package:stealth_chat/util/socket/server/server_events.dart';

part 'receive_status_event.freezed.dart';
part 'receive_status_event.g.dart';

class ReceiveStatusEvent extends ServerEvent<ReceiveStatusMessage> {
  ReceiveStatusEvent(Stream<Message> messages, Globals globals)
      : super(messages, 'RECEIVE_STATUS',
            (data) => ReceiveStatusMessage.fromJson(data),
            callback: (message) async {
          await globals.db.contacts.updateStatus(
              message.contactId,
              message.online,
              DateTime.fromMillisecondsSinceEpoch(message.lastSeen));
        });
}

@freezed
abstract class ReceiveStatusMessage with _$ReceiveStatusMessage {
  const factory ReceiveStatusMessage(
      {String contactId, bool online, int lastSeen}) = _ReceiveStatusMessage;

  factory ReceiveStatusMessage.fromJson(Map<String, dynamic> json) =>
      _$ReceiveStatusMessageFromJson(json);
}
