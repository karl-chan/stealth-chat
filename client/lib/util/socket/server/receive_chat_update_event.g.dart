// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receive_chat_update_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReceiveChatUpdateMessage _$_$_ReceiveChatUpdateMessageFromJson(
    Map<String, dynamic> json) {
  return _$_ReceiveChatUpdateMessage(
    contactId: json['contactId'] as String,
    timestamp: json['timestamp'] as int,
    event: json['event'] as String,
    eventTimestamp: json['eventTimestamp'] as int,
  );
}

Map<String, dynamic> _$_$_ReceiveChatUpdateMessageToJson(
        _$_ReceiveChatUpdateMessage instance) =>
    <String, dynamic>{
      'contactId': instance.contactId,
      'timestamp': instance.timestamp,
      'event': instance.event,
      'eventTimestamp': instance.eventTimestamp,
    };
