import 'dart:async';

import 'package:async/async.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:phoenix_socket/phoenix_socket.dart';
import 'package:stealth_chat/globals.dart';
import 'package:stealth_chat/socket/events.dart';
import 'package:stealth_chat/util/security/rsa.dart';

class Socket {
  final Globals globals;

  PhoenixSocket socket;
  PhoenixChannel channel;

  // server events
  Stream<int> timestampStream;
  Stream<String> errorStream;
  Stream<InviteAcceptedMessage> inviteAcceptedStream;

  // client events
  StreamController<AcceptInviteMessage> acceptInviteStream;
  StreamController<AckLastMessageTimestampMessage>
      ackLastMessageTimestampStream;

  Socket(Globals globals) : this.globals = globals;

  void connect() {
    assert(globals.user.keys != null, "User is not signed in!");

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

    socket = PhoenixSocket('$socketHost/socket/websocket',
        socketOptions: PhoenixSocketOptions(params: params))
      ..connect();

    socket.openStream.listen((event) {
      channel = socket.addChannel(
          topic: 'user:${globals.user.id}',
          parameters: {'last_message_timestamp': globals.lastMessageTimestamp});

      registerServerEvents();
      registerClientEvents();
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

  void registerServerEvents() {
    final splitter = StreamSplitter(channel.messages);
    splitter.split().forEach((message) {
      globals.lastMessageTimestamp = message.payload['timestamp'];
    });
    errorStream = splitter
        .split()
        .where((message) => message.event.value == ServerEvent.ERROR)
        .map((message) =>
            ErrorMessage.fromJson(message.payload['data']).message);
    inviteAcceptedStream = splitter
        .split()
        .where((message) => message.event.value == ServerEvent.INVITE_ACCEPTED)
        .map((message) =>
            InviteAcceptedMessage.fromJson(message.payload['data']));
    channel.close();
  }

  void registerClientEvents() {
    acceptInviteStream = StreamController()
      ..stream.forEach((message) =>
          channel.push(ClientEvent.ACCEPT_INVITE, message.toJson()));

    ackLastMessageTimestampStream = StreamController()
      ..stream.forEach((message) => channel.push(
          ClientEvent.ACK_LAST_MESSAGE_TIMESTAMP, message.toJson()));
  }

  void disconnect() {
    if (socket != null) {
      ackLastMessageTimestampStream.add(AckLastMessageTimestampMessage(
          lastMessageTimestamp: globals.lastMessageTimestamp));
      socket.dispose();
    }
  }
}
