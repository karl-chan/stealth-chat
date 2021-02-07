import 'package:flutter_test/flutter_test.dart';
import 'package:stealth_chat/util/time.dart';

void main() {
  test('shortHumanFormat today', () async {
    DateTime now = DateTime.now();
    DateTime threePm = DateTime(now.year, now.month, now.day, 15);
    expect(Time.shortHumanFormat(threePm), equals('3:00 PM'));
  });

  test('shortHumanFormat yesterday', () async {
    DateTime ytd = DateTime.now().subtract(Duration(days: 1));
    DateTime threePm = DateTime(ytd.year, ytd.month, ytd.day, 15);
    expect(Time.shortHumanFormat(threePm), equals('Yesterday'));
  });

  test('shortHumanFormat general', () async {
    DateTime dt = DateTime(2001, 2, 3, 4);
    expect(Time.shortHumanFormat(dt), equals('2/3/2001'));
  });
}
