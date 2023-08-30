class CheckoutModel {
  final DataUser dataUser;
  final DataProfile dataProfile;
  final List<DataCheckout> dataCheckout;

  CheckoutModel({
    required this.dataUser,
    required this.dataProfile,
    required this.dataCheckout,
  });

  factory CheckoutModel.fromJson(Map<String, dynamic> json) => CheckoutModel(
        dataUser: DataUser.fromJson(json["data_user"]),
        dataProfile: DataProfile.fromJson(json["data_profile"]),
        dataCheckout: List<DataCheckout>.from(
            json["data_checkout"].map((x) => DataCheckout.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data_user": dataUser.toJson(),
        "data_profile": dataProfile.toJson(),
        "data_checkout":
            List<dynamic>.from(dataCheckout.map((x) => x.toJson())),
      };
}

class DataCheckout {
  final List<Item> items;
  final WarehouseItem warehouseItem;

  DataCheckout({
    required this.items,
    required this.warehouseItem,
  });

  factory DataCheckout.fromJson(Map<String, dynamic> json) => DataCheckout(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        warehouseItem: WarehouseItem.fromJson(json["warehouse_item"]),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "warehouse_item": warehouseItem.toJson(),
      };
}

class Item {
  final String idBarang;
  final String gambar1;
  final String judul;
  final int berat;
  final int harga;
  final int hargaPromo;
  final int diskon;
  final int quantityOrder;
  final int subtotal;

  Item({
    required this.idBarang,
    required this.gambar1,
    required this.judul,
    required this.berat,
    required this.harga,
    required this.hargaPromo,
    required this.diskon,
    required this.quantityOrder,
    required this.subtotal,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        idBarang: json["id_barang"],
        gambar1: json["gambar1"],
        judul: json["judul"],
        berat: json["berat"],
        harga: json["harga"],
        hargaPromo: json["harga_promo"],
        diskon: json["diskon"],
        quantityOrder: json["quantityOrder"],
        subtotal: json["subtotal"],
      );

  Map<String, dynamic> toJson() => {
        "id_barang": idBarang,
        "gambar1": gambar1,
        "judul": judul,
        "berat": berat,
        "harga": harga,
        "harga_promo": hargaPromo,
        "diskon": diskon,
        "quantityOrder": quantityOrder,
        "subtotal": subtotal,
      };
}

class WarehouseItem {
  final String idcabang;
  final String namaCabang;
  final String alamatCabang;

  WarehouseItem({
    required this.idcabang,
    required this.namaCabang,
    required this.alamatCabang,
  });

  factory WarehouseItem.fromJson(Map<String, dynamic> json) => WarehouseItem(
        idcabang: json["idcabang"],
        namaCabang: json["nama_cabang"],
        alamatCabang: json["alamat_cabang"],
      );

  Map<String, dynamic> toJson() => {
        "idcabang": idcabang,
        "nama_cabang": namaCabang,
        "alamat_cabang": alamatCabang,
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
  final DataAlamatUser dataAlamatUser;
  final int poinUser;

  DataUser({
    required this.dataAlamatUser,
    required this.poinUser,
  });

  factory DataUser.fromJson(Map<String, dynamic> json) => DataUser(
        dataAlamatUser: DataAlamatUser.fromJson(json["data_alamat_user"]),
        poinUser: json["poin_user"],
      );

  Map<String, dynamic> toJson() => {
        "data_alamat_user": dataAlamatUser.toJson(),
        "poin_user": poinUser,
      };
}

class DataAlamatUser {
  final String idAlamatUser;
  final String alamatUser;
  final String teleponUser;
  final String namaPenerimaUser;
  final String labelAlamatUser;

  DataAlamatUser({
    required this.idAlamatUser,
    required this.alamatUser,
    required this.teleponUser,
    required this.namaPenerimaUser,
    required this.labelAlamatUser,
  });

  factory DataAlamatUser.fromJson(Map<String, dynamic> json) => DataAlamatUser(
        idAlamatUser: json["id_alamat_user"],
        alamatUser: json["alamat_user"],
        teleponUser: json["telepon_user"],
        namaPenerimaUser: json["nama_penerima_user"],
        labelAlamatUser: json["label_alamat_user"],
      );

  Map<String, dynamic> toJson() => {
        "id_alamat_user": idAlamatUser,
        "alamat_user": alamatUser,
        "telepon_user": teleponUser,
        "nama_penerima_user": namaPenerimaUser,
        "label_alamat_user": labelAlamatUser,
      };
}
