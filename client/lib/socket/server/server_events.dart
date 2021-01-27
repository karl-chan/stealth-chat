import 'package:async/async.dart';
import 'package:phoenix_socket/phoenix_socket.dart';
import 'package:stealth_chat/globals.dart';
import 'package:stealth_chat/socket/server/error_event.dart';
import 'package:stealth_chat/socket/server/invite_accepted_event.dart';

class ServerEvents {
  ErrorEvent error;
  InviteAcceptedEvent inviteAccepted;

  ServerEvents(PhoenixChannel channel, Globals globals) {
    final splitter = StreamSplitter(channel.messages);

    splitter.split().forEach((message) {
      if (message.payload?.containsKey('timestamp') == true) {
        globals.lastMessageTimestamp = message.payload['timestamp'];
      }
    });

    error = ErrorEvent(splitter.split());
    inviteAccepted = InviteAcceptedEvent(splitter.split());

    splitter.close();
  }
}

typedef FromJson<T> = T Function(Map<String, dynamic> data);

class ServerEvent<T> {
  final Stream<T> stream;

  ServerEvent(Stream<Message> messages, String event, FromJson<T> fromJson)
      : this.stream = messages
            .where((message) => message.event.value == event)
            .map((message) => fromJson(message.payload['data']));
}
