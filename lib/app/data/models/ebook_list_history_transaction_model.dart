class EbookListHistoryTransactionModel {
  final String idTransaksi;
  final String statusTransaksi;
  final DateTime tanggalTransaksi;
  final int totalHargaFinal;
  final String jumlahBarang;
  final List<Barang> barang; // Perubahan disini

  EbookListHistoryTransactionModel({
    required this.idTransaksi,
    required this.statusTransaksi,
    required this.tanggalTransaksi,
    required this.totalHargaFinal,
    required this.jumlahBarang,
    required this.barang,
  });

  factory EbookListHistoryTransactionModel.fromJson(Map<String, dynamic> json) =>
      EbookListHistoryTransactionModel(
        idTransaksi: json['id_transaksi'],
        statusTransaksi: json['status_transaksi'],
        tanggalTransaksi: DateTime.parse(json['tanggal_transaksi']),
        totalHargaFinal: json['total_harga_final'],
        jumlahBarang: json['jumlah_barang'],
        barang: List<Barang>.from(json['barang'].map((x) => Barang.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'id_transaksi': idTransaksi,
        'status_transaksi': statusTransaksi,
        'tanggal_transaksi': tanggalTransaksi.toIso8601String(),
        'total_harga_final': totalHargaFinal,
        'jumlah_barang': jumlahBarang,
        'barang': List<dynamic>.from(barang.map((x) => x.toJson())), // Perubahan disini
      };
}

class Barang {
  final String idBarang;
  final String slugEbook;
  final String gambar1;
  final String judul;
  final int subTotal;

  Barang({
    required this.idBarang,
    required this.slugEbook,
    required this.gambar1,
    required this.judul,
    required this.subTotal,
  });

  factory Barang.fromJson(Map<String, dynamic> json) => Barang(
        idBarang: json['id_barang'],
        slugEbook: json['slug_ebook'],
        gambar1: json['gambar1'],
        judul: json['judul'],
        subTotal: json['sub_total'],
      );

  Map<String, dynamic> toJson() => {
        'id_barang': idBarang,
        'slug_ebook': slugEbook,
        'gambar1': gambar1,
        'judul': judul,
        'sub_total': subTotal,
      };
}
