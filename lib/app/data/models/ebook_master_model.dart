import 'dart:ffi';

class EbookMasterModel {
  final String idBarang;
  final String slugBarang;
  final String gambar1;
  final String judul;
  final int harga;
  final int diskon;
  final int jenisTransaksi;
  final String? jumlah;
  final bool statusStok;
  final String rating;

  EbookMasterModel({
    required this.idBarang,
    required this.slugBarang,
    required this.gambar1,
    required this.judul,
    required this.harga,
    required this.diskon,
    required this.jenisTransaksi,
    this.jumlah,
    required this.statusStok,
    required this.rating,
  });

  factory EbookMasterModel.fromJson(Map<String, dynamic> json) =>
      EbookMasterModel(
        idBarang: json["id_barang"],
        slugBarang: json["slug_barang"],
        gambar1: json["gambar1"],
        judul: json["judul"],
        harga: json["harga"],
        diskon: json["diskon"],
        jenisTransaksi: json['jenis_transaksi'],
        jumlah: json["jumlah"],
        statusStok: json["status_stok"],
        rating: json["rating"],
      );

  Map<String, dynamic> toMap() => {
        "id_barang": idBarang,
        "slug_barang": slugBarang,
        "gambar1": gambar1,
        "judul": judul,
        "harga": harga,
        "diskon": diskon,
        "jenis_transaksi": jenisTransaksi,
        "jumlah": jumlah,
        "status_stok": statusStok,
        "rating": rating,
      };
}
