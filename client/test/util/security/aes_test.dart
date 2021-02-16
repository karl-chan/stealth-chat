import 'package:flutter_test/flutter_test.dart';
import 'package:stealth_chat/util/security/aes.dart';
import 'package:stealth_chat/util/security/keys.dart';

void main() {
  Keys keys;

  setUpAll(() async {
    keys = await Keys.generate('user', 'pass');
  });

  test('aes encrypt / decrypt', () {
    const message = 'The quick brown fox jumps over the lazy dog.';
    final encrypted = Aes.encrypt(message, keys);
    final decrypted = Aes.decrypt(encrypted, keys);
    expect(decrypted, equals(message));
  });
}
