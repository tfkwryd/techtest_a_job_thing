import 'package:intl/intl.dart';

class DateTimeUtils {
  static String format({
    required DateTime dateTime,
    required String dateFormat,
  }) {
    return DateFormat(dateFormat).format(dateTime);
  }

  static String formatFromMicrosecondsSinceEpoch({
    required int date,
    required String dateFormat,
  }) {
    return DateFormat(dateFormat)
        .format(DateTime.fromMicrosecondsSinceEpoch(date));
  }

  static bool isToday({required DateTime dateTime}) {
    var _now = DateTime.now();
    return dateTime.day == _now.day &&
        dateTime.month == _now.month &&
        dateTime.year == _now.year;
  }

  static bool isYesterday({required DateTime dateTime}) {
    var _now = DateTime.now().subtract(const Duration(days: 1));
    return dateTime.day == _now.day &&
        dateTime.month == _now.month &&
        dateTime.year == _now.year;
  }
}
