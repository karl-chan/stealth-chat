// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invite_accepted_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_InviteAcceptedMessage _$_$_InviteAcceptedMessageFromJson(
    Map<String, dynamic> json) {
  return _$_InviteAcceptedMessage(
    id: json['id'] as String,
    name: json['name'] as String,
    encryptedChatSecretKey: json['encryptedChatSecretKey'] as String,
    timestamp: json['timestamp'] as int,
  );
}

Map<String, dynamic> _$_$_InviteAcceptedMessageToJson(
        _$_InviteAcceptedMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'encryptedChatSecretKey': instance.encryptedChatSecretKey,
      'timestamp': instance.timestamp,
    };
