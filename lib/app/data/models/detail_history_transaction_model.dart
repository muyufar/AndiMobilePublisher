class DetailHistoryTransactionModel {
  final Transaksi transaksi;
  final AlamatUser alamatUser;
  final Kurir kurir;
  final List<Barang> barang;
  final RincianHarga rincianHarga;

  DetailHistoryTransactionModel({
    required this.transaksi,
    required this.alamatUser,
    required this.kurir,
    required this.barang,
    required this.rincianHarga,
  });

  factory DetailHistoryTransactionModel.fromJson(Map<String, dynamic> json) =>
      DetailHistoryTransactionModel(
        transaksi: Transaksi.fromJson(json['transaksi']),
        alamatUser: AlamatUser.fromJson(json['alamat_user']),
        kurir: Kurir.fromJson(json['kurir']),
        barang:
            List<Barang>.from(json['barang'].map((x) => Barang.fromJson(x))),
        rincianHarga: RincianHarga.fromJson(json['rincian_harga']),
      );

  Map<String, dynamic> toJson() => {
        'transaksi': transaksi.toJson(),
        'alamat_user': alamatUser.toJson(),
        'kurir': kurir.toJson(),
        'barang': List<dynamic>.from(barang.map((x) => x.toJson())),
        'rincian_harga': rincianHarga.toJson(),
      };
}

class AlamatUser {
  final String labelAlamat;
  final String alamatPengiriman;
  final String namaPenerima;
  final String teleponPenerima;

  AlamatUser({
    required this.labelAlamat,
    required this.alamatPengiriman,
    required this.namaPenerima,
    required this.teleponPenerima,
  });

  factory AlamatUser.fromJson(Map<String, dynamic> json) => AlamatUser(
        labelAlamat: json['label_alamat'],
        alamatPengiriman: json['alamat_pengiriman'],
        namaPenerima: json['nama_penerima'],
        teleponPenerima: json['telepon_penerima'],
      );

  Map<String, dynamic> toJson() => {
        'label_alamat': labelAlamat,
        'alamat_pengiriman': alamatPengiriman,
        'nama_penerima': namaPenerima,
        'telepon_penerima': teleponPenerima,
      };
}

class Barang {
  final String idBarang;
  final String judul;
  final int hargaNormal;
  final int diskon;
  final int hargaSetelahDiskon;
  final int jumlahBeli;
  final int subTotal;
  final String gambar1;

  Barang({
    required this.idBarang,
    required this.judul,
    required this.hargaNormal,
    required this.diskon,
    required this.hargaSetelahDiskon,
    required this.jumlahBeli,
    required this.subTotal,
    required this.gambar1,
  });

  factory Barang.fromJson(Map<String, dynamic> json) => Barang(
        idBarang: json['id_barang'],
        judul: json['judul'],
        hargaNormal: json['harga_normal'],
        diskon: json['diskon'],
        hargaSetelahDiskon: json['harga_setelah_diskon'],
        jumlahBeli: json['jumlah_beli'],
        subTotal: json['sub_total'],
        gambar1: json['gambar1'],
      );

  Map<String, dynamic> toJson() => {
        'id_barang': idBarang,
        'judul': judul,
        'harga_normal': hargaNormal,
        'diskon': diskon,
        'harga_setelah_diskon': hargaSetelahDiskon,
        'jumlah_beli': jumlahBeli,
        'sub_total': subTotal,
        'gambar1': gambar1,
      };
}

class Kurir {
  final String kurirPengiriman;
  final String kurirService;
  final String nomorResi;
  final String totalBerat;
  final String catatanPembeli;

  Kurir({
    required this.kurirPengiriman,
    required this.kurirService,
    required this.nomorResi,
    required this.totalBerat,
    required this.catatanPembeli,
  });

  factory Kurir.fromJson(Map<String, dynamic> json) => Kurir(
        kurirPengiriman: json['kurir_pengiriman'],
        kurirService: json['kurir_service'],
        nomorResi: json['nomor_resi'],
        totalBerat: json['total_berat'],
        catatanPembeli: json['catatan_pembeli'],
      );

  Map<String, dynamic> toJson() => {
        'kurir_pengiriman': kurirPengiriman,
        'kurir_service': kurirService,
        'nomor_resi': nomorResi,
        'total_berat': totalBerat,
        'catatan_pembeli': catatanPembeli,
      };
}

class RincianHarga {
  final int totalHargaSebelumDiskon;
  final int hargaOngkir;
  final int voucherHarga;
  final int voucherOngkir;
  final int biayaPenanganan;
  final int pointUser;
  final int totalHargaFinal;

  RincianHarga({
    required this.totalHargaSebelumDiskon,
    required this.hargaOngkir,
    required this.voucherHarga,
    required this.voucherOngkir,
    required this.biayaPenanganan,
    required this.pointUser,
    required this.totalHargaFinal,
  });

  factory RincianHarga.fromJson(Map<String, dynamic> json) => RincianHarga(
        totalHargaSebelumDiskon: json['total_harga_sebelum_diskon'],
        hargaOngkir: json['harga_ongkir'],
        voucherHarga: json['voucher_harga'],
        voucherOngkir: json['voucher_ongkir'],
        biayaPenanganan: json['biaya_penanganan'],
        pointUser: json['point_user'],
        totalHargaFinal: json['total_harga_final'],
      );

  Map<String, dynamic> toJson() => {
        'total_harga_sebelum_diskon': totalHargaSebelumDiskon,
        'harga_ongkir': hargaOngkir,
        'voucher_harga': voucherHarga,
        'voucher_ongkir': voucherOngkir,
        'biaya_penanganan': biayaPenanganan,
        'point_user': pointUser,
        'total_harga_final': totalHargaFinal,
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
