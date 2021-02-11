import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:phoenix_socket/phoenix_socket.dart';
import 'package:stealth_chat/globals.dart';
import 'package:stealth_chat/util/socket/server/server_events.dart';

part 'receive_chat_update_event.freezed.dart';
part 'receive_chat_update_event.g.dart';

class ReceiveChatUpdateEvent extends ServerEvent<ReceiveChatUpdateMessage> {
  ReceiveChatUpdateEvent(Stream<Message> messages, Globals globals)
      : super(messages, 'RECEIVE_CHAT_UPDATE',
            (data) => ReceiveChatUpdateMessage.fromJson(data),
            callback: (message) async {
          switch (message.event) {
            case 'sent':
              await globals.db.chatMessages.updateSent(
                  message.contactId,
                  DateTime.fromMillisecondsSinceEpoch(message.timestamp),
                  DateTime.fromMillisecondsSinceEpoch(message.eventTimestamp));
              break;
            case 'delivered':
              await globals.db.chatMessages.updateDelivered(
                  message.contactId,
                  DateTime.fromMillisecondsSinceEpoch(message.timestamp),
                  DateTime.fromMillisecondsSinceEpoch(message.eventTimestamp));
              break;
            case 'read':
              await globals.db.chatMessages.updateRead(
                  message.contactId,
                  DateTime.fromMillisecondsSinceEpoch(message.timestamp),
                  DateTime.fromMillisecondsSinceEpoch(message.eventTimestamp));
              break;
          }
        });
}

@freezed
abstract class ReceiveChatUpdateMessage with _$ReceiveChatUpdateMessage {
  const factory ReceiveChatUpdateMessage(
      {String contactId,
      int timestamp,
      String event,
      int eventTimestamp}) = _ReceiveChatUpdateMessage;

  factory ReceiveChatUpdateMessage.fromJson(Map<String, dynamic> json) =>
      _$ReceiveChatUpdateMessageFromJson(json);
}
