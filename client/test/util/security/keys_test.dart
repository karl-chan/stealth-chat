import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:stealth_chat/util/security/keys.dart';

void main() {
  test('computeSecretKey generates keys of length 256 bits (32 bytes)', () {
    final secretKey = Keys.computeSecretKey('user', 'pass');
    expect(base64Decode(secretKey), hasLength(32));
  });

  test('hash / verify secret key', () {
    final secretKey = Keys.computeSecretKey('user', 'pass');
    final hash = Keys.hashSecretKey(secretKey, 'user');
    final success = Keys.verifySecretKey(secretKey, 'user', hash);
    expect(success, isTrue);
  });
}
