import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:phoenix_socket/phoenix_socket.dart';
import 'package:stealth_chat/globals.dart';
import 'package:stealth_chat/socket/client/ack_last_message_timestamp_channel.dart';
import 'package:stealth_chat/socket/client/client_events.dart';
import 'package:stealth_chat/socket/server/server_events.dart';
import 'package:stealth_chat/util/logging.dart';
import 'package:stealth_chat/util/security/rsa.dart';

class Socket {
  final Globals globals;

  PhoenixSocket socket;
  PhoenixChannel channel;

  ServerEvents server;
  ClientEvents client;

  Socket(Globals globals) : this.globals = globals;

  void connect() {
    assert(globals.user.keys != null, 'User is not signed in!');

    String socketHost = globals.properties.get('server.socket.host');

    String sigUser = globals.user.id;
    int sigTimestamp = DateTime.now().toUtc().millisecondsSinceEpoch ~/ 1000;
    String msg = '$sigTimestamp';
    String sigHash = Rsa.sign(msg, globals.user.keys);

    final params = {
      'sig-user': sigUser,
      'sig-timestamp': sigTimestamp.toString(),
      'sig-hash': sigHash
    };

    logInfo('Socket connection params: $params');

    socket = PhoenixSocket('$socketHost/socket/websocket',
        socketOptions: PhoenixSocketOptions(params: params))
      ..connect();

    socket.openStream.listen((event) async {
      // join channel
      logInfo('Socket open stream event: $event');
      channel = socket.addChannel(
          topic: 'user:${globals.user.id}',
          parameters: {'last_message_timestamp': globals.lastMessageTimestamp});
      channel.join();

      server = ServerEvents(channel, globals);
      client = ClientEvents(channel);
    });

    socket.errorStream.listen((event) {
      Get.defaultDialog(
          title: 'Socket connection error',
          content: Container(
              height: Get.height * 0.7,
              child: SingleChildScrollView(
                  child: Text(event.stacktrace.toString()))));
    });
  }

  Future<void> close() async {
    await client.ackLastMessageTimestamp
        .push(AckLastMessageTimestampMessage(
            lastMessageTimestamp: globals.lastMessageTimestamp))
        .future;

    socket.dispose();
    channel = null;
    socket = null;
  }
}
