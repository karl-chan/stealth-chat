import 'package:flutter_test/flutter_test.dart';
import 'package:stealth_chat/util/security/aes.dart';
import 'package:stealth_chat/util/security/keys.dart';

void main() {
  Keys keys;

  setUpAll(() async {
    keys = await Keys.generate('user', 'pass');
  });

  test('aes encrypt / decrypt', () async {
    const message = 'The quick brown fox jumps over the lazy dog.';
    final encrypted = await Aes.encrypt(message, keys);
    final decrypted = await Aes.decrypt(encrypted, keys);
    expect(decrypted, equals(message));
  });
}
