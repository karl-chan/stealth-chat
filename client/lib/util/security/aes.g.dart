// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AesMessage _$_$_AesMessageFromJson(Map<String, dynamic> json) {
  return _$_AesMessage(
    encrypted: json['encrypted'] as String,
    iv: json['iv'] as String,
  );
}

Map<String, dynamic> _$_$_AesMessageToJson(_$_AesMessage instance) =>
    <String, dynamic>{
      'encrypted': instance.encrypted,
      'iv': instance.iv,
    };
