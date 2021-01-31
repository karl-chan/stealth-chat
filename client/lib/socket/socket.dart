import 'dart:async';

import 'package:async/async.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:phoenix_socket/phoenix_socket.dart';
import 'package:stealth_chat/globals.dart';
import 'package:stealth_chat/util/security/rsa.dart';

part 'socket.freezed.dart';
part 'socket.g.dart';

class Socket {
  final Globals globals;

  PhoenixSocket socket;
  PhoenixChannel channel;

  // incoming streams
  Stream<int> timestampStream;
  Stream<String> errorStream;
  Stream<InviteAcceptedMessage> inviteAcceptedStream;

  // outgoing streams
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
      channel = socket.addChannel(topic: 'user:${globals.user.id}',
          // TODO: Fix timestamp
          parameters: {'last_message_timestamp': 0});

      final splitter = StreamSplitter(channel.messages);
      splitter.split().forEach((message) {
        globals.lastMessageTimestamp = message.payload['timestamp'];
      });
      errorStream = splitter
          .split()
          .where((message) => message.event.value == Events.ERROR)
          .map((message) =>
              ErrorMessage.fromJson(message.payload['data']).message);
      inviteAcceptedStream = splitter
          .split()
          .where((message) => message.event.value == Events.INVITE_ACCEPTED)
          .map((message) =>
              InviteAcceptedMessage.fromJson(message.payload['data']));
      channel.close();

      ackLastMessageTimestampStream = StreamController();
      ackLastMessageTimestampStream.stream.forEach(ack);
    });

    socket.errorStream.listen((event) {
      Get.defaultDialog(
          title: 'Socket connection error',
          middleText: event.stacktrace.toString());
    });
  }

  void ack(AckLastMessageTimestampMessage message) {
    channel.push(Events.ACK_LAST_MESSAGE_TIMESTAMP, message.toJson());
  }

  void disconnect() {
    if (socket != null) {
      ackLastMessageTimestampStream.add(AckLastMessageTimestampMessage(
          lastMessageTimestamp: globals.lastMessageTimestamp));
      socket.dispose();
    }
  }
}

class Events {
  // incoming events
  static const ERROR = 'ERROR';
  static const INVITE_ACCEPTED = 'INVITE_ACCEPTED';

  // outgoing events
  static const ACCEPT_INVITE = "ACCEPT_INVITE";
  static const ACK_LAST_MESSAGE_TIMESTAMP = 'ACK_LAST_MESSAGE_TIMESTAMP';
}

@freezed
abstract class AcceptInviteMessage with _$AcceptInviteMessage {
  const factory AcceptInviteMessage() = _AcceptInviteMessage;

  factory AcceptInviteMessage.fromJson(Map<String, dynamic> json) =>
      _$AcceptInviteMessageFromJson(json);
}

@freezed
abstract class AckLastMessageTimestampMessage
    with _$AckLastMessageTimestampMessage {
  const factory AckLastMessageTimestampMessage({int lastMessageTimestamp}) =
      _AckLastMessageTimestampMessage;

  factory AckLastMessageTimestampMessage.fromJson(Map<String, dynamic> json) =>
      _$AckLastMessageTimestampMessageFromJson(json);
}

@freezed
abstract class ErrorMessage with _$ErrorMessage {
  const factory ErrorMessage({String message}) = _ErrorMessage;

  factory ErrorMessage.fromJson(Map<String, dynamic> json) =>
      _$ErrorMessageFromJson(json);
}

@freezed
abstract class InviteAcceptedMessage with _$InviteAcceptedMessage {
  const factory InviteAcceptedMessage() = _InviteAcceptedMessage;

  factory InviteAcceptedMessage.fromJson(Map<String, dynamic> json) =>
      _$InviteAcceptedMessageFromJson(json);
}
