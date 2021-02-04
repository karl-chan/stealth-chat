import 'package:flutter_test/flutter_test.dart';
import 'package:stealth_chat/util/properties.dart';

void main() {
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  test('get', () async {
    final properties = await Properties.init();
    expect(properties.get('server.host'), equals('http://localhost:3000'));
  });
}
