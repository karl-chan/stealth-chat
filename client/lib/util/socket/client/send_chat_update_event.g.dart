// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_chat_update_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SendChatUpdateMessage _$_$_SendChatUpdateMessageFromJson(
    Map<String, dynamic> json) {
  return _$_SendChatUpdateMessage(
    contactId: json['contactId'] as String,
    timestamp: json['timestamp'] as int,
    event: json['event'] as String,
    eventTimestamp: json['eventTimestamp'] as int,
  );
}

Map<String, dynamic> _$_$_SendChatUpdateMessageToJson(
        _$_SendChatUpdateMessage instance) =>
    <String, dynamic>{
      'contactId': instance.contactId,
      'timestamp': instance.timestamp,
      'event': instance.event,
      'eventTimestamp': instance.eventTimestamp,
    };
