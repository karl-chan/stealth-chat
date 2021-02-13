// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receive_status_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReceiveStatusMessage _$_$_ReceiveStatusMessageFromJson(
    Map<String, dynamic> json) {
  return _$_ReceiveStatusMessage(
    contactId: json['contactId'] as String,
    online: json['online'] as bool,
    lastSeen: json['lastSeen'] as int,
  );
}

Map<String, dynamic> _$_$_ReceiveStatusMessageToJson(
        _$_ReceiveStatusMessage instance) =>
    <String, dynamic>{
      'contactId': instance.contactId,
      'online': instance.online,
      'lastSeen': instance.lastSeen,
    };
