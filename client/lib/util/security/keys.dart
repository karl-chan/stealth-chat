import 'package:crypton/crypton.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:steel_crypt/steel_crypt.dart';

part 'keys.freezed.dart';

@freezed
abstract class Keys with _$Keys {
  const factory Keys(
      {String secretKey,
      RSAPublicKey publicKey,
      RSAPrivateKey privateKey}) = _Keys;

  static Future<Keys> generate(String userId, String password) async {
    final secretKey = await computeSecretKey(userId, password);
    final rsa = RSAKeypair.fromRandom();
    final publicKey = rsa.publicKey;
    final privateKey = rsa.privateKey;

    return Keys(
        secretKey: secretKey, publicKey: publicKey, privateKey: privateKey);
  }

  static final scrypt = PassCrypt.scrypt(cpu: 2048);

  static String randomSecretKey() {
    return CryptKey().genFortuna(len: 32);
  }

  static Future<String> computeSecretKey(String userId, String password) async {
    return compute(_computeSecretKey, {'userId': userId, 'password': password});
  }

  static Future<String> hashSecretKey(String secretKey, String userId) async {
    return computeSecretKey(userId, secretKey);
  }

  static Future<bool> verifySecretKey(
      String secretKey, String userId, String hash) async {
    return compute(_verifySecretKey,
        {'secretKey': secretKey, 'userId': userId, 'hash': hash});
  }

  static Future<String> _computeSecretKey(Map<String, Object> params) async {
    return scrypt.hash(salt: params['userId'], inp: params['password']);
  }

  static Future<bool> _verifySecretKey(Map<String, Object> params) async {
    return scrypt.check(
        plain: params['secretKey'],
        hashed: params['hash'],
        salt: params['userId']);
  }
}
