// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_contacts_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DeleteContactsMessage _$_$_DeleteContactsMessageFromJson(
    Map<String, dynamic> json) {
  return _$_DeleteContactsMessage(
    contactIds: (json['contactIds'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$_$_DeleteContactsMessageToJson(
        _$_DeleteContactsMessage instance) =>
    <String, dynamic>{
      'contactIds': instance.contactIds,
    };
