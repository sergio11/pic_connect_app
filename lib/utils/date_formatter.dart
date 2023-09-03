import 'package:intl/intl.dart';

class DateFormatter {

  static String getDateFormatted(DateTime dataTime) {
    return DateFormat.yMMMd().format(dataTime);
  }

  static String getTimeAgo(DateTime dateTime, {bool numericDates = true}) {
    final date2 = DateTime.now();
    final difference = date2.difference(dateTime);

    if ((difference.inDays / 7).floor() >= 1) {
      return getDateFormatted(dateTime);
    } else if (difference.inDays >= 2) {
      return '${difference.inDays}d ago';
    } else if (difference.inDays >= 1) {
      return (numericDates) ? '1d' : 'Yesterday';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours}h ago';
    } else if (difference.inHours >= 1) {
      return (numericDates) ? '1h' : 'An hour ago';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inMinutes >= 1) {
      return (numericDates) ? '1m' : 'A min ago';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds}s ago';
    } else {
      return 'Just now';
    }
  }
}
