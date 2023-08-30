import 'package:intl/intl.dart';

extension ExtensionString on int {
  String parceRp() {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: 0,
    );

    return currencyFormatter.format(this);
  }
}
