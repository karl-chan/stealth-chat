// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accept_invite_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AcceptInviteMessage _$_$_AcceptInviteMessageFromJson(
    Map<String, dynamic> json) {
  return _$_AcceptInviteMessage(
    theirId: json['theirId'] as String,
    myName: json['myName'] as String,
    encryptedChatSecretKey: json['encryptedChatSecretKey'] as String,
  );
}

Map<String, dynamic> _$_$_AcceptInviteMessageToJson(
        _$_AcceptInviteMessage instance) =>
    <String, dynamic>{
      'theirId': instance.theirId,
      'myName': instance.myName,
      'encryptedChatSecretKey': instance.encryptedChatSecretKey,
    };
