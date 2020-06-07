import 'dart:convert';

import 'package:stealth_chat/util/security/keys.dart';

class Rsa {
  static String sign(String message, Keys keys) {
    // ignore: deprecated_member_use
    return base64
        .encode(keys.privateKey.createSHA256Signature(utf8.encode(message)));
  }

  static bool verify(String message, String signature, Keys keys) {
    return keys.publicKey
        .verifySHA256Signature(utf8.encode(message), base64.decode(signature));
  }
}
