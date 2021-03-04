import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stealth_chat/util/security/keys.dart';
import 'package:steel_crypt/steel_crypt.dart';

part 'aes.freezed.dart';
part 'aes.g.dart';

class Aes {
  static Future<AesMessage> encrypt(String message, Keys keys) async {
    if (message.isEmpty) {
      return AesMessage(encrypted: '', iv: '');
    }
    return compute(_encrypt, {'message': message, 'secretKey': keys.secretKey});
  }

  static Future<AesMessage> _encrypt(Map<String, Object> params) async {
    final iv = CryptKey().genDart();
    final aes = AesCrypt(padding: PaddingAES.pkcs7, key: params['secretKey']);
    final encrypted = aes.gcm.encrypt(inp: params['message'], iv: iv);
    return AesMessage(encrypted: encrypted, iv: iv);
  }

  static Future<String> decrypt(AesMessage encrypted, Keys keys) async {
    if (encrypted.encrypted.isEmpty) {
      return '';
    }
    return compute(_decrypt, {
      'encrypted': encrypted.encrypted,
      'iv': encrypted.iv,
      'secretKey': keys.secretKey
    });
  }

  static Future<String> _decrypt(Map<String, Object> params) async {
    final aes = AesCrypt(padding: PaddingAES.pkcs7, key: params['secretKey']);
    return aes.gcm.decrypt(enc: params['encrypted'], iv: params['iv']);
  }
}

@freezed
abstract class AesMessage with _$AesMessage {
  const factory AesMessage({String encrypted, String iv}) = _AesMessage;

  factory AesMessage.fromJson(Map<String, dynamic> json) =>
      _$AesMessageFromJson(json);
}
