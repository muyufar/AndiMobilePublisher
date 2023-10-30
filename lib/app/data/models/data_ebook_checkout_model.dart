import 'dart:ffi';

class DataEbookCheckoutModel {
  final User user;
  VoucherEbook? voucher;
  String kodeVoucher;
  List<DataEbookCheckoutMolde>? dataEbookCheckout;

  DataEbookCheckoutModel({
    required this.user,
    this.voucher,
    this.kodeVoucher = "",
    this.dataEbookCheckout,
  });

  factory DataEbookCheckoutModel.fromJson(Map<String, dynamic> json) =>
      DataEbookCheckoutModel(
        user: User.fromJson(json['user']),
        voucher: VoucherEbook.fromJson(json['voucher']),
        kodeVoucher: json['voucherCode'],
        dataEbookCheckout: List<DataEbookCheckoutMolde>.from(
          json['dataCheckout'].map((x) => DataEbookCheckoutMolde.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
        'user': user.toJson(),
        // 'voucher': voucher.toJson(),
        'voucherCode' : kodeVoucher,
        'dataCheckout':
            List<dynamic>.from(dataEbookCheckout!.map((x) => x.toJson())),
      };
}

class DataEbookCheckoutMolde {
  final List<Product> products;

  DataEbookCheckoutMolde({
    required this.products,
  });

  factory DataEbookCheckoutMolde.fromJson(Map<String, dynamic> json) =>
      DataEbookCheckoutMolde(
        products: List<Product>.from(
          json['products'].map((x) => Product.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
        'products': List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  final String idProduct;
  final bool isBuy;

  Product({
    required this.idProduct,
    required this.isBuy,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        idProduct: json['idProduct'],
        isBuy: json['isBuy'],
      );

  Map<String, dynamic> toJson() => {
        'idProduct': idProduct,
        'isBuy': isBuy,
      };
}

class User {
  final String idUser;
  final bool usePoinUser;

  User({
    required this.idUser,
    required this.usePoinUser,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        idUser: json['id'],
        usePoinUser: json['usePoinUser'],
      );

  Map<String, dynamic> toJson() => {
        'id': idUser,
        'usePoinUser': usePoinUser,
      };
}

class VoucherEbook {
  final bool isVoucher;
  // final String voucherCode;

  VoucherEbook({
    required this.isVoucher,
    // required this.voucherCode,
  });

  factory VoucherEbook.fromJson(Map<String, dynamic> json) => VoucherEbook(
        isVoucher: json['isVoucher'],
        // voucherCode: json['voucherCode'],
            // json["voucher"] != null && json["voucher"]["isVoucher"] == true,

      );

  Map<String, dynamic> toJson() => {
        'isVoucher': isVoucher,
      };
}

class Discounte {
  final int harga;
  final int persen;

  Discounte({
    required this.harga,
    required this.persen,
  });

  factory Discounte.fromJson(Map<String, dynamic> json) => Discounte(
        harga: json['harga'] ?? 0,
        persen: json['persen'] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        'harga': harga,
        'persen': persen,
      };
}
