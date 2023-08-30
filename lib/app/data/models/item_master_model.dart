class ItemMasterModel {
  final String idBarang;
  final String slugBarang;
  final String gambar1;
  final String judul;
  final int harga;
  final int diskon;
  final bool statusStok;

  ItemMasterModel({
    required this.idBarang,
    required this.slugBarang,
    required this.gambar1,
    required this.judul,
    required this.harga,
    required this.diskon,
    required this.statusStok,
  });

  factory ItemMasterModel.fromJson(Map<String, dynamic> json) =>
      ItemMasterModel(
        idBarang: json["id_barang"],
        slugBarang: json["slug_barang"],
        gambar1: json["gambar1"],
        judul: json["judul"],
        harga: json["harga"],
        diskon: json["diskon"],
        statusStok: json["status_stok"],
      );

  Map<String, dynamic> toMap() => {
        "id_barang": idBarang,
        "slug_barang": slugBarang,
        "gambar1": gambar1,
        "judul": judul,
        "harga": harga,
        "diskon": diskon,
        "status_stok": statusStok,
      };
}
