import 'package:async/async.dart';
import 'package:phoenix_socket/phoenix_socket.dart';
import 'package:stealth_chat/globals.dart';
import 'package:stealth_chat/util/logging.dart';
import 'package:stealth_chat/util/socket/server/invite_accepted_event.dart';
import 'package:stealth_chat/util/socket/server/receive_chat_event.dart';
import 'package:stealth_chat/util/socket/server/receive_chat_update_event.dart';
import 'package:stealth_chat/util/socket/server/receive_status_event.dart';

class ServerEvents {
  InviteAcceptedEvent inviteAccepted;
  ReceiveChatEvent receiveChat;
  ReceiveChatUpdateEvent receiveChatUpdate;
  ReceiveStatusEvent receiveStatus;

  ServerEvents(PhoenixChannel channel, Globals globals) {
    final splitter = StreamSplitter(channel.messages);

    splitter.split().forEach((message) {
      if (message.payload?.containsKey('timestamp') == true) {
        globals.lastMessageTimestamp = message.payload['timestamp'];
        logDebug(
            'Received last message timestamp: ${globals.lastMessageTimestamp}');
      }
    });

    inviteAccepted = InviteAcceptedEvent(splitter.split(), globals);
    receiveChat = ReceiveChatEvent(splitter.split(), globals);
    receiveChatUpdate = ReceiveChatUpdateEvent(splitter.split(), globals);
    receiveStatus = ReceiveStatusEvent(splitter.split(), globals);

    splitter.close();
  }
}

typedef FromJson<T> = T Function(Map<String, dynamic> data);
typedef ServerEventCallback<T> = Function(T t);

class ServerEvent<T> {
  final Stream<T> stream;

  ServerEvent(Stream<Message> messages, String event, FromJson<T> fromJson,
      {ServerEventCallback<T> callback})
      : this.stream = messages
            .where((message) => message.event.value == event)
            .map((message) {
          final payload = message.payload['data'];
          logDebug('Server event: $event payload: $payload');
          return fromJson(payload);
        }) {
    if (callback != null) {
      stream.listen(callback);
    }
  }
}
