class Voucher {
  final String idVoucher;
  final String idItemVoucher;
  final String name;
  // final Discount diskon;
  // final Discount sewa;
  final DateInfo date;
  final String minimumTransaction;

  Voucher({
    required this.idVoucher,
    required this.idItemVoucher,
    required this.name,
    // required this.diskon,
    // required this.sewa,
    required this.date,
    required this.minimumTransaction,
  });

  factory Voucher.fromJson(Map<String, dynamic> json) {
    return Voucher(
      idVoucher: json['idVoucher'],
      idItemVoucher: json['idItemVoucher'],
      name: json['name'],
      // diskon: Discount.fromJson(json['diskon']),
      // sewa: Discount.fromJson(json['sewa']),
      date: DateInfo.fromJson(json['date']),
      minimumTransaction: json['minimum_transaction'],
    );
  }
}

// // class Discount {
//   final int persen;
//   final int nominal;

//   Discount({
//     required this.persen,
//     required this.nominal,
//   });

//   factory Discount.fromJson(Map<String, dynamic> json) {
//     return Discount(
//       persen: json['persen'],
//       nominal: json['nominal'],
//     );
//   }
// }

class DateInfo {
  final String start;
  final String end;
  final String now;

  DateInfo({
    required this.start,
    required this.end,
    required this.now,
  });

  factory DateInfo.fromJson(Map<String, dynamic> json) {
    return DateInfo(
      start: json['start'],
      end: json['end'],
      now: json['now'],
    );
  }
}
