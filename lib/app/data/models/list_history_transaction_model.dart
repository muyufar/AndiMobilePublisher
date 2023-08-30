class ListHistoryTransactionModel {
  final String idTransaksi;
  final String statusTransaksi;
  final DateTime tanggalTransaksi;
  final int totalHargaFinal;
  final String jumlahBarang;
  final Barang barang;

  ListHistoryTransactionModel({
    required this.idTransaksi,
    required this.statusTransaksi,
    required this.tanggalTransaksi,
    required this.totalHargaFinal,
    required this.jumlahBarang,
    required this.barang,
  });

  factory ListHistoryTransactionModel.fromJson(Map<String, dynamic> json) =>
      ListHistoryTransactionModel(
        idTransaksi: json['id_transaksi'],
        statusTransaksi: json['status_transaksi'],
        tanggalTransaksi: DateTime.parse(json['tanggal_transaksi']),
        totalHargaFinal: json['total_harga_final'],
        jumlahBarang: json['jumlah_barang'],
        barang: Barang.fromJson(json['barang']),
      );

  Map<String, dynamic> toJson() => {
        'id_transaksi': idTransaksi,
        'status_transaksi': statusTransaksi,
        'tanggal_transaksi': tanggalTransaksi.toIso8601String(),
        'total_harga_final': totalHargaFinal,
        'jumlah_barang': jumlahBarang,
        'barang': barang.toJson(),
      };
}

class Barang {
  final String idBarang;
  final String slugBarang;
  final String gambar1;
  final String judul;
  final int jumlahBeli;
  final int subTotal;

  Barang({
    required this.idBarang,
    required this.slugBarang,
    required this.gambar1,
    required this.judul,
    required this.jumlahBeli,
    required this.subTotal,
  });

  factory Barang.fromJson(Map<String, dynamic> json) => Barang(
        idBarang: json['id_barang'],
        slugBarang: json['slug_barang'],
        gambar1: json['gambar1'],
        judul: json['judul'],
        jumlahBeli: json['jumlah_beli'],
        subTotal: json['sub_total'],
      );

  Map<String, dynamic> toJson() => {
        'id_barang': idBarang,
        'slug_barang': slugBarang,
        'gambar1': gambar1,
        'judul': judul,
        'jumlah_beli': jumlahBeli,
        'sub_total': subTotal,
      };
}
