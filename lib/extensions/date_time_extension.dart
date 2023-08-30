import 'package:intl/intl.dart';

extension CustomDateTimeFormatting on DateTime {
  String toCustomFormat() {
    final dateFormat = DateFormat('dd-MM-yyyy HH:mm');
    return dateFormat.format(this);
  }
}
