class DataEbookCheckoutModel {
  final User user;
  final VoucherEbook voucher;
  final List<DataEbookCheckoutMolde> dataEbookCheckout;

  DataEbookCheckoutModel({
    required this.user,
    required this.voucher,
    required this.dataEbookCheckout,
  });

  factory DataEbookCheckoutModel.fromJson(Map<String, dynamic> json) =>
      DataEbookCheckoutModel(
        user: User.fromJson(json['user']),
        voucher: VoucherEbook.fromJson(json['voucher']),
        dataEbookCheckout: List<DataEbookCheckoutMolde>.from(
          json['dataCheckout'].map((x) => DataEbookCheckoutMolde.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
        'user': user.toJson(),
        'voucher': voucher.toJson(),
        'dataCheckout':
            List<dynamic>.from(dataEbookCheckout.map((x) => x.toJson())),
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

  Product({
    required this.idProduct,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        idProduct: json['idProduct'],
      );

  Map<String, dynamic> toJson() => {
        'idProduct': idProduct,
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
        idUser: json['idUser'],
        usePoinUser: json['usePoinUser'],
      );

  Map<String, dynamic> toJson() => {
        'idUser': idUser,
        'usePoinUser': usePoinUser,
      };
}

class VoucherEbook {
  final bool isVoucher;
  final String name;
  final String code;
  final int minimalTransaction;
  final Discount beli;
  final Discount sewa;
  final String end;

  VoucherEbook({
    required this.isVoucher,
    required this.name,
    required this.code,
    required this.minimalTransaction,
    required this.beli,
    required this.sewa,
    required this.end,
  });

  factory VoucherEbook.fromJson(Map<String, dynamic> json) => VoucherEbook(
        isVoucher: json['isVoucher'],
        name: json['name'],
        code: json['code'],
        minimalTransaction: json['minimalTransaction'],
        beli: Discount.fromJson(json['beli']),
        sewa: Discount.fromJson(json['sewa']),
        end: json['end'],
      );

  Map<String, dynamic> toJson() => {
        'isVoucher': isVoucher,
        'name': name,
        'code': code,
        'minimalTransaction': minimalTransaction,
        'beli': beli.toJson(),
        'sewa': sewa.toJson(),
        'end': end,
      };
}

class Discount {
  final int harga;
  final int persen;

  Discount({
    required this.harga,
    required this.persen,
  });

  factory Discount.fromJson(Map<String, dynamic> json) => Discount(
        harga: json['harga'] ?? 0,
        persen: json['persen'] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        'harga': harga,
        'persen': persen,
      };
}
