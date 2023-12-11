import 'package:intl/intl.dart';

/// parceRp
///
/// This extension method formats an integer to Indonesian Rupiah.

/// Parameters
///
/// * `this`: The integer to be formatted.

/// Returns
///
/// A string representing the formatted integer in Indonesian Rupiah.

/// Usage
///
/// To use this extension method, first you need to import it. Then, you can use it to format an integer like this:
///
///
/// int price = 10000;
/// String formattedPrice = price.parceRp();
///
/// This code will create an integer representing the price of 10000. Then, the extension method `parceRp` will be used to format the integer to Indonesian Rupiah. The resulting string will be stored in the variable `formattedPrice`.

extension ExtensionString on num {
  String parceRp() {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: 0,
    );

    return currencyFormatter.format(this);
  }
}
