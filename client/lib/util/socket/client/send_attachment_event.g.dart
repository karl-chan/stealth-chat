// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_attachment_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SendAttachmentMessage _$_$_SendAttachmentMessageFromJson(
    Map<String, dynamic> json) {
  return _$_SendAttachmentMessage(
    contactId: json['contactId'] as String,
    timestamp: json['timestamp'] as int,
    encrypted: json['encrypted'] as String,
    iv: json['iv'] as String,
  );
}

Map<String, dynamic> _$_$_SendAttachmentMessageToJson(
        _$_SendAttachmentMessage instance) =>
    <String, dynamic>{
      'contactId': instance.contactId,
      'timestamp': instance.timestamp,
      'encrypted': instance.encrypted,
      'iv': instance.iv,
    };
