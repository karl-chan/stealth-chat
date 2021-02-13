// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_status_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SendStatusMessage _$_$_SendStatusMessageFromJson(Map<String, dynamic> json) {
  return _$_SendStatusMessage(
    contactIds: (json['contactIds'] as List)?.map((e) => e as String)?.toList(),
    online: json['online'] as bool,
    lastSeen: json['lastSeen'] as int,
  );
}

Map<String, dynamic> _$_$_SendStatusMessageToJson(
        _$_SendStatusMessage instance) =>
    <String, dynamic>{
      'contactIds': instance.contactIds,
      'online': instance.online,
      'lastSeen': instance.lastSeen,
    };
