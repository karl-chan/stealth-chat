// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receive_chat_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReceiveChatMessage _$_$_ReceiveChatMessageFromJson(
    Map<String, dynamic> json) {
  return _$_ReceiveChatMessage(
    contactId: json['contactId'] as String,
    message: json['message'] as String,
    timestamp: json['timestamp'] as int,
  );
}

Map<String, dynamic> _$_$_ReceiveChatMessageToJson(
        _$_ReceiveChatMessage instance) =>
    <String, dynamic>{
      'contactId': instance.contactId,
      'message': instance.message,
      'timestamp': instance.timestamp,
    };
