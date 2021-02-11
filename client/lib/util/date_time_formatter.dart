import 'package:intl/intl.dart';

class DateTimeFormatter {
  static String formatDateShort(DateTime dt) {
    DateTime now = DateTime.now();
    bool isToday = _ymdEquals(dt, now);

    if (isToday) {
      return 'Today';
    }

    bool isYesterday = _ymdEquals(dt, now.subtract(Duration(days: 1)));
    if (isYesterday) {
      return 'Yesterday';
    }
    return DateFormat.yMd().format(dt);
  }

  static String formatDateLong(DateTime dt) {
    return DateFormat('EEEE, dd MMMM yyyy h:mm:ss a').format(dt);
  }

  static String formatTime(DateTime dt) {
    return DateFormat.jm().format(dt);
  }

  static String formatShort(DateTime dt) {
    DateTime now = DateTime.now();
    bool isToday = _ymdEquals(dt, now);

    if (isToday) {
      return formatTime(dt);
    }

    return formatDateShort(dt);
  }

  static bool _ymdEquals(DateTime dt, DateTime other) {
    return dt.year == other.year &&
        dt.month == other.month &&
        dt.day == other.day;
  }
}
