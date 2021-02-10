// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_chat_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SendChatMessage _$_$_SendChatMessageFromJson(Map<String, dynamic> json) {
  return _$_SendChatMessage(
    contactId: json['contactId'] as String,
    encrypted: json['encrypted'] as String,
    iv: json['iv'] as String,
    timestamp: json['timestamp'] as int,
  );
}

Map<String, dynamic> _$_$_SendChatMessageToJson(_$_SendChatMessage instance) =>
    <String, dynamic>{
      'contactId': instance.contactId,
      'encrypted': instance.encrypted,
      'iv': instance.iv,
      'timestamp': instance.timestamp,
    };
