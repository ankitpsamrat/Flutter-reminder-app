import 'package:intl/intl.dart';

class CommonUtils {
  //

  static String formattedDate(DateTime date) {
    return DateFormat.yMMMd().format(date);
  }
}
