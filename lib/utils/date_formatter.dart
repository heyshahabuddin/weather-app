import 'package:intl/intl.dart';

class DateFormatter {
  static String formatFullDateTime(DateTime dateTime) {
    return DateFormat('hh:mm a, EEEE, dd MMM yyyy').format(dateTime);
  }

  static String formatTime(String isoTime) {
    final dateTime = DateTime.parse(isoTime);
    return DateFormat('hh:mm a').format(dateTime);
  }

  static String formatHour(String isoTime) {
    final dateTime = DateTime.parse(isoTime);
    return DateFormat('ha').format(dateTime);
  }
}