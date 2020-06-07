import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stealth_chat/util/security/keys.dart';
import 'package:steel_crypt/steel_crypt.dart';

part 'aes.freezed.dart';
part 'aes.g.dart';

class Aes {
  static AesMessage encrypt(String message, Keys keys) {
    final iv = CryptKey().genDart();
    final aes = AesCrypt(padding: PaddingAES.pkcs7, key: keys.secretKey);
    final encrypted = aes.gcm.encrypt(inp: message, iv: iv);
    return AesMessage(encrypted: encrypted, iv: iv);
  }

  static String decrypt(AesMessage encrypted, Keys keys) {
    final aes = AesCrypt(padding: PaddingAES.pkcs7, key: keys.secretKey);
    return aes.gcm.decrypt(enc: encrypted.encrypted, iv: encrypted.iv);
  }
}

@freezed
abstract class AesMessage with _$AesMessage {
  const factory AesMessage({String encrypted, String iv}) = _AesMessage;

  factory AesMessage.fromJson(Map<String, dynamic> json) =>
      _$AesMessageFromJson(json);
}
