class DataCheckoutModel {
  final User user;
  final Voucher voucher;
  final List<DataCheckoutMolde> dataCheckout;

  DataCheckoutModel({
    required this.user,
    required this.voucher,
    required this.dataCheckout,
  });

  factory DataCheckoutModel.fromJson(Map<String, dynamic> json) =>
      DataCheckoutModel(
        user: User.fromJson(json['user']),
        voucher: Voucher.fromJson(json['voucher']),
        dataCheckout: List<DataCheckoutMolde>.from(
            json['dataCheckout'].map((x) => DataCheckoutMolde.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'user': user.toJson(),
        'voucher': voucher.toJson(),
        'dataCheckout': List<dynamic>.from(dataCheckout.map((x) => x.toJson())),
      };
}

class DataCheckoutMolde {
  final String idWarehouse;
  final String? noteUserBuy;
  final Courier courier;
  final List<Product> products;

  DataCheckoutMolde({
    required this.idWarehouse,
    required this.noteUserBuy,
    required this.courier,
    required this.products,
  });

  factory DataCheckoutMolde.fromJson(Map<String, dynamic> json) =>
      DataCheckoutMolde(
        idWarehouse: json['idWarehouse'],
        noteUserBuy: json['noteUserBuy'],
        courier: Courier.fromJson(json['courier']),
        products: List<Product>.from(
            json['products'].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'idWarehouse': idWarehouse,
        'noteUserBuy': noteUserBuy,
        'courier': courier.toJson(),
        'products': List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Courier {
  final String courierService;
  final String courierCode;

  Courier({
    required this.courierService,
    required this.courierCode,
  });

  factory Courier.fromJson(Map<String, dynamic> json) => Courier(
        courierService: json['courierService'],
        courierCode: json['courierCode'],
      );

  Map<String, dynamic> toJson() => {
        'courierService': courierService,
        'courierCode': courierCode,
      };
}

class Product {
  final String idProduct;
  final int quantity;

  Product({
    required this.idProduct,
    required this.quantity,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        idProduct: json['idProduct'],
        quantity: json['quantity'],
      );

  Map<String, dynamic> toJson() => {
        'idProduct': idProduct,
        'quantity': quantity,
      };
}

class User {
  final String idUser;
  final String idAddressUser;
  final bool usePoinUser;

  User({
    required this.idUser,
    required this.idAddressUser,
    required this.usePoinUser,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        idUser: json['idUser'],
        idAddressUser: json['idAddressUser'],
        usePoinUser: json['usePoinUser'],
      );

  Map<String, dynamic> toJson() => {
        'idUser': idUser,
        'idAddressUser': idAddressUser,
        'usePoinUser': usePoinUser,
      };
}

class Voucher {
  final String? idVoucherProduct;
  final String? idVoucherCourier;

  Voucher({
    required this.idVoucherProduct,
    required this.idVoucherCourier,
  });

  factory Voucher.fromJson(Map<String, dynamic> json) => Voucher(
        idVoucherProduct: json['idVoucherProduct'],
        idVoucherCourier: json['idVoucherCourier'],
      );

  Map<String, dynamic> toJson() => {
        'idVoucherProduct': idVoucherProduct,
        'idVoucherCourier': idVoucherCourier,
      };
}
