class DataCartModel {
  final String idDetailKeranjang;
  final String idUser;
  final String cabangStokId;
  final List<Barang> barang;

  DataCartModel({
    required this.idDetailKeranjang,
    required this.idUser,
    required this.cabangStokId,
    required this.barang,
  });

  factory DataCartModel.fromJson(Map<String, dynamic> json) => DataCartModel(
        idDetailKeranjang: json["id_detail_keranjang"],
        idUser: json["id_user"],
        cabangStokId: json["cabang_stok_id"],
        barang:
            List<Barang>.from(json["barang"].map((x) => Barang.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id_detail_keranjang": idDetailKeranjang,
        "id_user": idUser,
        "cabang_stok_id": cabangStokId,
        "barang": List<dynamic>.from(barang.map((x) => x.toJson())),
      };
}

class Barang {
  final String idBarang;
  final String slugBarang;
  final String gambar1;
  final String judul;
  final int jumlahKeranjang;
  final int qtyStok;

  Barang({
    required this.idBarang,
    required this.slugBarang,
    required this.gambar1,
    required this.judul,
    required this.jumlahKeranjang,
    required this.qtyStok,
  });

  factory Barang.fromJson(Map<String, dynamic> json) => Barang(
        idBarang: json["id_barang"],
        slugBarang: json["slug_barang"],
        gambar1: json["gambar1"],
        judul: json["judul"],
        jumlahKeranjang: json["jumlah_keranjang"],
        qtyStok: json["qty_stok"],
      );

  Map<String, dynamic> toJson() => {
        "id_barang": idBarang,
        "slug_barang": slugBarang,
        "gambar1": gambar1,
        "judul": judul,
        "jumlah_keranjang": jumlahKeranjang,
        "qty_stok": qtyStok,
      };
}
