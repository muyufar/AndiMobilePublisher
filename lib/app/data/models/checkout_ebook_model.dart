class CheckoutEbookModel {
  final DataUser dataUser;
  final DataProfile dataProfile;
  final List<DataEbookCheckout> dataEbookCheckout;
  final Subtotal subtotal;
  final bool voucherCode;

  CheckoutEbookModel({
    required this.dataUser,
    required this.dataProfile,
    required this.subtotal,
    required this.dataEbookCheckout,
    required this.voucherCode,
  });

  factory CheckoutEbookModel.fromJson(Map<String, dynamic> json) =>
      CheckoutEbookModel(
        subtotal: Subtotal.fromJson(json["subtotal"]),
        dataUser: DataUser.fromJson(json["data_user"]),
        dataProfile: DataProfile.fromJson(json["data_profile"]),
        dataEbookCheckout: List<DataEbookCheckout>.from(
          json["data_checkout"].map(
            (x) => DataEbookCheckout.fromJson(x),
          ),
        ),
        voucherCode:
            json["voucher"] != null && json["voucher"]["isVoucher"] == true,
      );

  Map<String, dynamic> toJson() => {
        "data_user": dataUser.toJson(),
        "data_profile": dataProfile.toJson(),
        "data_checkout":
            List<dynamic>.from(dataEbookCheckout.map((x) => x.toJson())),
      };
}

class DataEbookCheckout {
  final List<Item> items;
  // final Subtotale subtotale;

  DataEbookCheckout({
    required this.items,
    // required this.subtotale,
  });

  factory DataEbookCheckout.fromJson(Map<String, dynamic> json) =>
      DataEbookCheckout(
        // subtotale: Subtotale.fromJson(json["subtotal"]),
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Diskon {
  final int barang;
  int voucher;

  Diskon({
    required this.barang,
    required this.voucher,
  });

  factory Diskon.fromJson(Map<String, dynamic> json) => Diskon(
        barang: json["barang"],
        voucher: json["voucher"],
      );
}

class Subtotal {
  final int harga;
  final Diskon diskon;
  final int penanganan;
  final int total;

  Subtotal({
    required this.harga,
    required this.diskon,
    required this.penanganan,
    required this.total,
  });

  factory Subtotal.fromJson(Map<String, dynamic> json) => Subtotal(
        harga: json["harga"],
        diskon: Diskon.fromJson(json["diskon"]),
        penanganan: json["penanganan"],
        total: json['total'],
      );

  Map<String, dynamic> toJson() => {
        "harga": harga,
        "diskon": diskon,
        "penanganan": penanganan,
        "total": total,
      };
}

class Item {
  final String idBarang;
  final String gambar1;
  final String judul;
  final String slugBarang;
  final int harga;
  final int hargaPromo;
  final int diskon;
  final int subtotal;

  Item({
    required this.idBarang,
    required this.gambar1,
    required this.slugBarang,
    required this.judul,
    required this.harga,
    required this.hargaPromo,
    required this.diskon,
    required this.subtotal,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        idBarang: json["id_barang"],
        gambar1: json["gambar1"],
        judul: json["judul"],
        slugBarang: json['slug_barang'],
        harga: json["harga"],
        hargaPromo: json["harga_promo"],
        diskon: json["diskon"],
        subtotal: json["subtotal"],
      );

  Map<String, dynamic> toJson() => {
        "id_barang": idBarang,
        "gambar1": gambar1,
        "judul": judul,
        "slug_barang": slugBarang,
        "harga": harga,
        "harga_promo": hargaPromo,
        "diskon": diskon,
        "subtotal": subtotal,
      };
}

class DataProfile {
  final int persenPoin;
  final int biayaPenanganan;

  DataProfile({
    required this.persenPoin,
    required this.biayaPenanganan,
  });

  factory DataProfile.fromJson(Map<String, dynamic> json) => DataProfile(
        persenPoin: json["persen_poin"],
        biayaPenanganan: json["biaya_penanganan"],
      );

  Map<String, dynamic> toJson() => {
        "persen_poin": persenPoin,
        "biaya_penanganan": biayaPenanganan,
      };
}

class DataUser {
  final int poinUser;

  DataUser({
    required this.poinUser,
  });

  factory DataUser.fromJson(Map<String, dynamic> json) => DataUser(
        poinUser: json["poin_user"],
      );

  Map<String, dynamic> toJson() => {
        "poin_user": poinUser,
      };
}

class Voucher {
  final bool isVoucher;
  final String? name;
  final String? code;
  final String? minimalTransaction;
  final VoucherDetail beli;
  final VoucherDetail sewa;
  final String? end;

  Voucher({
    required this.isVoucher,
    this.name,
    this.code,
    this.minimalTransaction,
    required this.beli,
    required this.sewa,
    this.end,
  });

  factory Voucher.fromJson(Map<String, dynamic> json) => Voucher(
        isVoucher: json["isVoucher"],
        name: json["name"],
        code: json["code"],
        minimalTransaction: json["minimalTransaction"],
        beli: VoucherDetail.fromJson(json["beli"]),
        sewa: VoucherDetail.fromJson(json["sewa"]),
        end: json["end"],
      );

  Map<String, dynamic> toJson() => {
        "isVoucher": isVoucher,
        "name": name,
        "code": code,
        "minimalTransaction": minimalTransaction,
        "beli": beli.toJson(),
        "sewa": sewa.toJson(),
        "end": end,
      };
}

class VoucherDetail {
  final int harga;
  final int persen;

  VoucherDetail({
    required this.harga,
    required this.persen,
  });

  factory VoucherDetail.fromJson(Map<String, dynamic> json) => VoucherDetail(
        harga: json["harga"],
        persen: json["persen"],
      );

  Map<String, dynamic> toJson() => {
        "harga": harga,
        "persen": persen,
      };
}

class VoucherResponse {
  final bool isVoucher;

  VoucherResponse({
    required this.isVoucher,
  });

  factory VoucherResponse.fromJson(Map<String, dynamic> json) =>
      VoucherResponse(
        isVoucher: json["isVoucher"],
      );
}
