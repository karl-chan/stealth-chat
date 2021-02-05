import 'package:flutter_test/flutter_test.dart';
import 'package:stealth_chat/util/security/keys.dart';
import 'package:stealth_chat/util/security/rsa.dart';

void main() {
  Keys keys;

  setUpAll(() {
    keys = Keys.generate('user', 'pass');
  });

  test('rsa sign / verification', () {
    const message = 'The quick brown fox jumps over the lazy dog.';
    final signature = Rsa.sign(message, keys);
    final success = Rsa.verify(message, signature, keys);
    expect(success, isTrue);
  });
}
