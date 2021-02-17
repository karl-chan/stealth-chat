import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stealth_chat/util/properties.dart';

void main() {
  Properties properties;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({'applink.host': 'override'});
    final prefs = await SharedPreferences.getInstance();
    properties = await Properties.init(prefs);
  });

  test('get', () async {
    expect(properties.get('applink.scheme'), equals('app'));
  });

  test('get with SharedPreferences override', () async {
    expect(properties.get('applink.host'), equals('override'));
  });
}
