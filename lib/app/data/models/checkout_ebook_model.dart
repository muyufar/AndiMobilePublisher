class CheckoutEbookModel {
  final DataUser dataUser;
  final DataProfile dataProfile;
  final List<DataEbookCheckout> dataEbookCheckout;

  CheckoutEbookModel({
    required this.dataUser,
    required this.dataProfile,
    required this.dataEbookCheckout,
  });

  factory CheckoutEbookModel.fromJson(Map<String, dynamic> json) =>
      CheckoutEbookModel(
          dataUser: DataUser.fromJson(json["data_user"]),
          dataProfile: DataProfile.fromJson(json["data_profile"]),
          dataEbookCheckout: List<DataEbookCheckout>.from(
            json["data_checkout"].map((x) => DataEbookCheckout.fromJson(x)),
          ));

  Map<String, dynamic> toJson() => {
        "data_user": dataUser.toJson(),
        "data_profile": dataProfile.toJson(),
        "data_checkout":
            List<dynamic>.from(dataEbookCheckout.map((x) => x.toJson())),
      };
}

class DataEbookCheckout {
  final List<Item> items;

  DataEbookCheckout({
    required this.items,
  });

  factory DataEbookCheckout.fromJson(Map<String, dynamic> json) =>
      DataEbookCheckout(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
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


// class DataAlamatUser {
//   final String idAlamatUser;
//   final String alamatUser;
//   final String teleponUser;
//   final String namaPenerimaUser;
//   final String labelAlamatUser;

//   DataAlamatUser({
//     required this.idAlamatUser,
//     required this.alamatUser,
//     required this.teleponUser,
//     required this.namaPenerimaUser,
//     required this.labelAlamatUser,
//   });

//   factory DataAlamatUser.fromJson(Map<String, dynamic> json) => DataAlamatUser(
//         idAlamatUser: json["id_alamat_user"],
//         alamatUser: json["alamat_user"],
//         teleponUser: json["telepon_user"],
//         namaPenerimaUser: json["nama_penerima_user"],
//         labelAlamatUser: json["label_alamat_user"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id_alamat_user": idAlamatUser,
//         "alamat_user": alamatUser,
//         "telepon_user": teleponUser,
//         "nama_penerima_user": namaPenerimaUser,
//         "label_alamat_user": labelAlamatUser,
//       };
