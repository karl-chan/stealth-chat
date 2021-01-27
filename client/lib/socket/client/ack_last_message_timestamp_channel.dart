import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:phoenix_socket/phoenix_socket.dart';
import 'package:stealth_chat/socket/client/client_events.dart';

part 'ack_last_message_timestamp_channel.freezed.dart';
part 'ack_last_message_timestamp_channel.g.dart';

class AckLastMessageTimestampEvent
    extends ClientEvent<AckLastMessageTimestampMessage> {
  AckLastMessageTimestampEvent(PhoenixChannel channel)
      : super(channel, 'ACK_LAST_MESSAGE_TIMESTAMP',
            (message) => message.toJson());
}

@freezed
abstract class AckLastMessageTimestampMessage
    with _$AckLastMessageTimestampMessage {
  const factory AckLastMessageTimestampMessage({int lastMessageTimestamp}) =
      _AckLastMessageTimestampMessage;

  factory AckLastMessageTimestampMessage.fromJson(Map<String, dynamic> json) =>
      _$AckLastMessageTimestampMessageFromJson(json);
}
