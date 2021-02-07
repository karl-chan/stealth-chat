import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:phoenix_socket/phoenix_socket.dart';
import 'package:stealth_chat/boot/boot_screen.dart';
import 'package:stealth_chat/globals.dart';
import 'package:stealth_chat/util/logging.dart';
import 'package:stealth_chat/util/security/rsa.dart';
import 'package:stealth_chat/util/socket/client/ack_last_message_timestamp_channel.dart';
import 'package:stealth_chat/util/socket/client/client_events.dart';
import 'package:stealth_chat/util/socket/server/server_events.dart';

class Socket {
  final Globals globals;

  PhoenixSocket socket;
  PhoenixChannel channel;

  ServerEvents server;
  ClientEvents client;

  Socket(Globals globals) : this.globals = globals;

  void connect() {
    assert(globals.user.keys != null, 'User is not signed in!');

    String sigUser = globals.user.id;
    int sigTimestamp = DateTime.now().toUtc().millisecondsSinceEpoch ~/ 1000;
    String msg = '$sigTimestamp';
    String sigHash = Rsa.sign(msg, globals.user.keys);

    final params = {
      'sig_user': sigUser,
      'sig_timestamp': sigTimestamp.toString(),
      'sig_hash': sigHash,
    };

    String socketHost = globals.properties.get('server.socket.host');
    socket = PhoenixSocket('$socketHost/socket/websocket',
        socketOptions: PhoenixSocketOptions(params: params))
      ..connect();

    socket.openStream.listen((event) async {
      logDebug('Last message timestamp: ${globals.lastMessageTimestamp}');
      channel = socket.addChannel(
          topic: 'user:${globals.user.id}',
          parameters: {'last_message_timestamp': globals.lastMessageTimestamp})
        ..join();

      server = ServerEvents(channel, globals);
      client = ClientEvents(channel);
    });

    socket.errorStream.listen((event) {
      Get.defaultDialog(
          title: 'Socket connection error',
          content: Column(children: [
            Icon(Icons.error, color: Colors.red, size: 50),
            Text(event.error.toString())
          ]),
          textConfirm: 'Restart app',
          confirmTextColor: Colors.white,
          onConfirm: () async {
            await close();
            await Get.offAll(BootScreen());
          });
    });
  }

  Future<void> close() async {
    if (client != null) {
      await client.ackLastMessageTimestamp
          .push(AckLastMessageTimestampMessage(
              lastMessageTimestamp: globals.lastMessageTimestamp))
          .future;
    }

    socket.dispose();
    channel = null;
    socket = null;
  }
}
