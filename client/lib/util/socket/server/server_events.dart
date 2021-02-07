import 'package:async/async.dart';
import 'package:phoenix_socket/phoenix_socket.dart';
import 'package:stealth_chat/globals.dart';
import 'package:stealth_chat/util/logging.dart';
import 'package:stealth_chat/util/socket/server/error_event.dart';
import 'package:stealth_chat/util/socket/server/heartbeat_event.dart';
import 'package:stealth_chat/util/socket/server/invite_accepted_event.dart';

class ServerEvents {
  ErrorEvent error;
  HeartbeatEvent heartbeat;
  InviteAcceptedEvent inviteAccepted;

  ServerEvents(PhoenixChannel channel, Globals globals) {
    final splitter = StreamSplitter(channel.messages);

    splitter.split().forEach((message) {
      if (message.payload?.containsKey('timestamp') == true) {
        globals.lastMessageTimestamp = message.payload['timestamp'];
      }
    });

    error = ErrorEvent(splitter.split());
    heartbeat = HeartbeatEvent(splitter.split());
    inviteAccepted = InviteAcceptedEvent(splitter.split(), globals);

    splitter.close();
  }
}

typedef FromJson<T> = T Function(Map<String, dynamic> data);
typedef ServerEventCallback<T> = void Function(T t);

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
