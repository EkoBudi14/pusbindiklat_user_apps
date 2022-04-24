import 'package:intl/intl.dart';

class DateTimeUtils {
  static String formatCharMonthDateTime(DateTime dateTime) {
    var date = DateFormat('dd-MM-yyyy').format(dateTime);

    return date;
  }
}
