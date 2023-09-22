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

  VoucherEbook({
    required this.isVoucher,
  });

  factory VoucherEbook.fromJson(Map<String, dynamic> json) => VoucherEbook(
        isVoucher: json['isVoucher'],
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
