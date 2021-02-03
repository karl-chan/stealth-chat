import 'package:crypton/crypton.dart';
import 'package:get/get.dart';
import 'package:stealth_chat/globals.dart';
import 'package:stealth_chat/util/security/aes.dart';
import 'package:stealth_chat/util/security/keys.dart';

class Auth {
  static void setUser(String id, String name, String password, Keys keys) {
    Globals globals = Get.find();
    assert(globals.user.id == null, "User is already registered!");

    final String hash = Keys.hashSecretKey(keys.secretKey, id);
    final encryptedPrivateKey = Aes.encrypt(keys.privateKey.toPEM(), keys);

    globals.prefs.setString(Prefs.USER_ID, id);
    globals.prefs.setString(Prefs.USER_NAME, name);
    globals.prefs.setString(Prefs.USER_PUBLIC_KEY, keys.publicKey.toPEM());
    globals.prefs.setString(
        Prefs.USER_PRIVATE_KEY_ENCRYPTED, encryptedPrivateKey.encrypted);
    globals.prefs
        .setString(Prefs.USER_PRIVATE_KEY_ENCRYPTED_IV, encryptedPrivateKey.iv);
    globals.prefs.setString(Prefs.USER_PASSWORD_HASH, hash);

    globals.user = User(id: id, name: name, keys: keys);
  }

  static bool login(String password) {
    Globals globals = Get.find();
    assert(globals.user.id != null, "User is not registered!");

    final String passwordHash =
        globals.prefs.getString(Prefs.USER_PASSWORD_HASH);
    final String publicKeyPem = globals.prefs.getString(Prefs.USER_PUBLIC_KEY);
    final String privateKeyEncryptedPem =
        globals.prefs.getString(Prefs.USER_PRIVATE_KEY_ENCRYPTED);
    final String privateKeyEncryptedPemIv =
        globals.prefs.getString(Prefs.USER_PRIVATE_KEY_ENCRYPTED_IV);

    String secretKey = Keys.computeSecretKey(globals.user.id, password);
    bool success =
        Keys.verifySecretKey(secretKey, globals.user.id, passwordHash);

    if (success) {
      Keys keys = Keys(secretKey: secretKey);
      String privateKeyPem = Aes.decrypt(
          AesMessage(
              encrypted: privateKeyEncryptedPem, iv: privateKeyEncryptedPemIv),
          keys);
      RSAPublicKey publicKey = RSAPublicKey.fromPEM(publicKeyPem);
      RSAPrivateKey privateKey = RSAPrivateKey.fromPEM(privateKeyPem);

      globals.user = globals.user.copyWith(
          keys: keys.copyWith(publicKey: publicKey, privateKey: privateKey));

      globals.socket.connect();

      return true;
    } else {
      return false;
    }
  }
}
