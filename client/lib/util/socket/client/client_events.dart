import 'package:phoenix_socket/phoenix_socket.dart';
import 'package:stealth_chat/util/logging.dart';
import 'package:stealth_chat/util/socket/client/accept_invite_event.dart';
import 'package:stealth_chat/util/socket/client/ack_accept_invite_event.dart';
import 'package:stealth_chat/util/socket/client/ack_last_message_timestamp_channel.dart';
import 'package:stealth_chat/util/socket/client/delete_contacts_event.dart';
import 'package:stealth_chat/util/socket/client/send_attachment_event.dart';
import 'package:stealth_chat/util/socket/client/send_chat_event.dart';
import 'package:stealth_chat/util/socket/client/send_chat_update_event.dart';

class ClientEvents {
  final AcceptInviteEvent acceptInvite;
  final AckAcceptInviteEvent ackAcceptInvite;
  final AckLastMessageTimestampEvent ackLastMessageTimestamp;
  final DeleteContactsEvent deleteContacts;
  final SendChatEvent sendChat;
  final SendChatUpdateEvent sendChatUpdate;
  final SendAttachmentEvent sendAttachment;

  ClientEvents(PhoenixChannel channel)
      : this.acceptInvite = AcceptInviteEvent(channel),
        this.ackAcceptInvite = AckAcceptInviteEvent(channel),
        this.ackLastMessageTimestamp = AckLastMessageTimestampEvent(channel),
        this.deleteContacts = DeleteContactsEvent(channel),
        this.sendChat = SendChatEvent(channel),
        this.sendChatUpdate = SendChatUpdateEvent(channel),
        this.sendAttachment = SendAttachmentEvent(channel);
}

typedef ToJson<T> = Map<String, dynamic> Function(T t);

abstract class ClientEvent<T> {
  final PhoenixChannel _channel;
  final String _event;
  final ToJson<T> _toJson;

  ClientEvent(PhoenixChannel channel, String event, ToJson<T> toJson)
      : this._channel = channel,
        this._event = event,
        this._toJson = toJson;

  Future<PushResponse> push(T t) async {
    final payload = _toJson(t);
    logDebug('Client event: $_event payload: $payload');
    final response = await _channel.push(_event, payload).future;
    return response;
  }
}
