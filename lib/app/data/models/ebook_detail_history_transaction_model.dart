
class EbookDetailHistoryTransactionModel {
  final Transaksi transaksi;
  final List<Items> items;
  final RincianHarga rincianHarga;

  EbookDetailHistoryTransactionModel({
    required this.transaksi,
    required this.items,
    required this.rincianHarga,
  });
  factory EbookDetailHistoryTransactionModel.fromJson(Map<String, dynamic> json) =>
  EbookDetailHistoryTransactionModel(
    transaksi: Transaksi.fromJson(json['transaksi']),
    items: List<Items>.from(json['items'].map((x) => Items.fromJson(x))),
    rincianHarga: RincianHarga.fromJson(json['rincian_harga']),
  );

  Map<String, dynamic> toJson() => {
    'transaksi' : transaksi.toJson(),
    'items' : List<dynamic>.from(items.map((x) => x.toJson())),
     'rincian_harga': rincianHarga.toJson(),
  };
}


class RincianHarga {
  final int totalHargaSebelumDiskon;
  final int voucherHarga;
  final int pointUser;
  final int totalHargaFinal;
  final int biayaPenaganan;

  RincianHarga({
    required this.totalHargaSebelumDiskon,
    required this.voucherHarga,
    required this.pointUser,
    required this.totalHargaFinal,
    required this.biayaPenaganan,
  });

  factory RincianHarga.fromJson(Map<String, dynamic> json) => RincianHarga(
        totalHargaSebelumDiskon: json['total_harga_sebelum_diskon'],
        voucherHarga: json['voucher_harga'],
        pointUser: json['point_user'],
        totalHargaFinal: json['total_harga_final'],
        biayaPenaganan: json['biaya_penanganan'],
      );

  Map<String, dynamic> toJson() => {
        'total_harga_sebelum_diskon': totalHargaSebelumDiskon,
        'voucher_harga': voucherHarga,
        'point_user': pointUser,
        'total_harga_final': totalHargaFinal,
        'biaya_penanganan' : biayaPenaganan,
      };
}

class Items {
  final String idBarang;
  final String judul;
  final int hargaNormal;
  final int diskon;
  final int hargaSetelahDiskon;
  final int subTotal;
  final String gambar1;
  final String namaVoucher;

  Items({
    required this.idBarang,
    required this.judul,
    required this.hargaNormal,
    required this.diskon,
    required this.hargaSetelahDiskon,
    required this.subTotal,
    required this.gambar1,
    required this.namaVoucher,
  });

  factory Items.fromJson(Map<String, dynamic> json) => Items(
        idBarang: json['id_barang'],
        judul: json['judul'],
        hargaNormal: json['harga_normal'],
        diskon: json['diskon'],
        hargaSetelahDiskon: json['harga_setelah_diskon'],
        subTotal: json['sub_total'],
        gambar1: json['gambar1'],
        namaVoucher: json['voucher_name'],
      );

  Map<String, dynamic> toJson() => {
        'id_barang': idBarang,
        'judul': judul,
        'harga_normal': hargaNormal,
        'diskon': diskon,
        'harga_setelah_diskon': hargaSetelahDiskon,
        'sub_total': subTotal,
        'gambar1': gambar1,
        'voucher_name' : namaVoucher,
      };
}

  class Transaksi {
  final String idTransaksi;
  final String idInvoice;
  final String statusTransaksi;
  final DateTime tanggalTransaksi;
  final DateTime? tanggalDibayar;
  final String metodePembayaran;
  final String paymentRedirect;

  Transaksi({
    required this.idTransaksi,
    required this.idInvoice,
    required this.statusTransaksi,
    required this.tanggalTransaksi,
    required this.tanggalDibayar,
    required this.metodePembayaran,
    required this.paymentRedirect,
  });

  factory Transaksi.fromJson(Map<String, dynamic> json) => Transaksi(
        idTransaksi: json['id_transaksi'],
        idInvoice: json['id_invoice'],
        statusTransaksi: json['status_transaksi'],
        tanggalTransaksi: DateTime.parse(json['tanggal_transaksi']),
        tanggalDibayar: json['tanggal_dibayar'] != null
            ? DateTime.parse(json['tanggal_dibayar'])
            : null,
        metodePembayaran: json['metode_pembayaran'],
        paymentRedirect: json['payment_redirect'],
      );

  Map<String, dynamic> toJson() => {
        'id_transaksi': idTransaksi,
        'id_invoice': idInvoice,
        'status_transaksi': statusTransaksi,
        'tanggal_transaksi': tanggalTransaksi.toIso8601String(),
        'tanggal_dibayar': tanggalDibayar?.toIso8601String(),
        'metode_pembayaran': metodePembayaran,
        'payment_redirect': paymentRedirect,
      };

}