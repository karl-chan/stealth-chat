// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receive_attachment_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReceiveAttachmentMessage _$_$_ReceiveAttachmentMessageFromJson(
    Map<String, dynamic> json) {
  return _$_ReceiveAttachmentMessage(
    contactId: json['contactId'] as String,
    timestamp: json['timestamp'] as int,
    encrypted: json['encrypted'] as String,
    iv: json['iv'] as String,
  );
}

Map<String, dynamic> _$_$_ReceiveAttachmentMessageToJson(
        _$_ReceiveAttachmentMessage instance) =>
    <String, dynamic>{
      'contactId': instance.contactId,
      'timestamp': instance.timestamp,
      'encrypted': instance.encrypted,
      'iv': instance.iv,
    };
