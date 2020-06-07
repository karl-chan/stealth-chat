import 'package:crypton/crypton.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:steel_crypt/steel_crypt.dart';

part 'keys.freezed.dart';

@freezed
abstract class Keys with _$Keys {
  const factory Keys(
      {String secretKey,
      RSAPublicKey publicKey,
      RSAPrivateKey privateKey}) = _Keys;

  static Keys generate(String userId, String password) {
    final secretKey = computeSecretKey(userId, password);
    final rsa = RSAKeypair.fromRandom();
    final publicKey = rsa.publicKey;
    final privateKey = rsa.privateKey;

    return Keys(
        secretKey: secretKey, publicKey: publicKey, privateKey: privateKey);
  }

  static final scrypt = PassCrypt.scrypt(cpu: 2048);

  static String computeSecretKey(String userId, String password) {
    return scrypt.hash(salt: userId, inp: password);
  }

  static String hashSecretKey(String secretKey, String userId) {
    return computeSecretKey(userId, secretKey);
  }

  static bool verifySecretKey(String secretKey, String userId, String hash) {
    return scrypt.check(plain: secretKey, hashed: hash, salt: userId);
  }
}
