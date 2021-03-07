import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:phoenix_socket/phoenix_socket.dart';
import 'package:stealth_chat/boot/boot_screen.dart';
import 'package:stealth_chat/globals.dart';
import 'package:stealth_chat/main.dart' show exit;
import 'package:stealth_chat/settings/settings_page.dart';
import 'package:stealth_chat/util/logging.dart';
import 'package:stealth_chat/util/security/rsa.dart';
import 'package:stealth_chat/util/socket/client/ack_last_message_timestamp_channel.dart';
import 'package:stealth_chat/util/socket/client/client_events.dart';
import 'package:stealth_chat/util/socket/server/server_events.dart';

class Socket {
  final Globals globals;

  PhoenixSocket socket;
  PhoenixChannel channel;
  bool errorFlag = false;

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

    socket = PhoenixSocket('wss://${globals.serverHost}/socket/websocket',
        socketOptions: PhoenixSocketOptions(params: params))
      ..connect();

    socket.openStream.listen((event) async {
      errorFlag = false;
      logDebug('Last message timestamp: ${globals.lastMessageTimestamp}');
      List<String> contactIds = await globals.db.contacts.getContactIds();
      channel =
          socket.addChannel(topic: 'user:${globals.user.id}', parameters: {
        'last_message_timestamp': globals.lastMessageTimestamp,
        'contact_ids': contactIds
      })
            ..join();

      server = ServerEvents(channel, globals);
      client = ClientEvents(channel);
    });

    socket.errorStream.listen((event) async {
      errorFlag = true;
      await Get.defaultDialog(
          title: 'Socket connection error',
          content: Column(children: [
            Icon(Icons.error, color: Colors.red, size: 50),
            Text(event.error.toString())
          ]),
          barrierDismissible: false,
          textConfirm: 'Restart app',
          confirmTextColor: Colors.white,
          onConfirm: () async {
            await exit();
            await Get.offAll(BootScreen(BootConfig()));
          },
          textCancel: 'Open settings',
          onCancel: () async {
            await close();
            await Get.offAll(SettingsPage());
          });
    });
  }

  Future<void> close() async {
    if (client != null && !errorFlag) {
      await Future.wait<dynamic>([
        client.ackLastMessageTimestamp.push(AckLastMessageTimestampMessage(
            lastMessageTimestamp: globals.lastMessageTimestamp)),
      ]);
    }

    if (socket != null) {
      socket.dispose();
    }

    channel = null;
    socket = null;
  }
}
