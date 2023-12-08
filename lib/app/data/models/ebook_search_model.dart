class EbookSearchModel {
  final String idBarang;
  final String slugBarang;
  final String gambar1;
  final String judul;
  final int harga;
  final int diskon;
  final int jenisTransaksi;
  final String jumlah;
  final bool statusStok;
  final String rating;

  EbookSearchModel({
    required this.idBarang,
    required this.slugBarang,
    required this.gambar1,
    required this.judul,
    required this.harga,
    required this.diskon,
    required this.jenisTransaksi,
    required this.jumlah,
    required this.statusStok,
    required this.rating,
  });
  factory EbookSearchModel.fromJson(Map<String, dynamic> json) {
    return EbookSearchModel(
      idBarang: json["id_barang"] ?? '',
      slugBarang: json["slug_barang"] ?? '',
      gambar1: json["gambar1"] ?? '',
      judul: json["judul"] ?? '',
      harga: json["harga"] ?? 0,
      diskon: json["diskon"] ?? 0,
      jenisTransaksi: json['jenis_transaksi'] ?? 0,
      jumlah: json["jumlah"] ?? '',
      statusStok: json["status_stok"] ?? 'true',
      rating: json["rating"] ?? '',
    );
  }

  Map toJson() => {
        'id_barang': idBarang,
        'slug_barang': slugBarang,
        'gambar1': gambar1,
        'judul': judul,
        'harga': harga,
        'diskon': diskon,
        'jenis_transaksi': jenisTransaksi,
        'jumlah': jumlah,
        'status_stock': statusStok,
        'rating': rating,
      };
}