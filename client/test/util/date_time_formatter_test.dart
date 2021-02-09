import 'package:flutter_test/flutter_test.dart';
import 'package:stealth_chat/util/date_time_formatter.dart';

void main() {
  test('formatShort today', () async {
    DateTime now = DateTime.now();
    DateTime threePm = DateTime(now.year, now.month, now.day, 15);
    expect(DateTimeFormatter.formatShort(threePm), equals('3:00 PM'));
  });

  test('formatShort yesterday', () async {
    DateTime ytd = DateTime.now().subtract(Duration(days: 1));
    DateTime threePm = DateTime(ytd.year, ytd.month, ytd.day, 15);
    expect(DateTimeFormatter.formatShort(threePm), equals('Yesterday'));
  });

  test('formatShort general', () async {
    DateTime dt = DateTime(2001, 2, 3, 4);
    expect(DateTimeFormatter.formatShort(dt), equals('2/3/2001'));
  });
}
