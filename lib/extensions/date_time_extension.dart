import 'package:intl/intl.dart';

/// toCustomFormat
///
/// This extension method formats a DateTime object to a custom format.

/// Parameters
///
/// * `this`: The DateTime object to be formatted.

/// Returns
///
/// A string representing the formatted DateTime object.

/// Usage
///
/// To use this extension method, first you need to import it. Then, you can use it to format a DateTime object like this:
///
///
/// DateTime now = DateTime.now();
/// String formattedDate = now.toCustomFormat();
///
/// This code will create a DateTime object representing the current date and time. Then, the extension method `toCustomFormat` will be used to format the DateTime object to the custom format `dd-MM-yyyy HH:mm`. The resulting string will be stored in the variable `formattedDate`.

extension CustomDateTimeFormatting on DateTime {
  String toCustomFormat() {
    final dateFormat = DateFormat('dd-MM-yyyy HH:mm');
    return dateFormat.format(this);
  }
}
