class CourierModel {
  final String layanan;
  final String kode;
  final String produk;
  final String estimasi;
  final int harga;

  CourierModel({
    required this.layanan,
    required this.kode,
    required this.produk,
    required this.estimasi,
    required this.harga,
  });

  factory CourierModel.fromJson(Map<String, dynamic> json) => CourierModel(
        layanan: json['layanan'],
        kode: json['kode'],
        produk: json['produk'],
        estimasi: json['estimasi'],
        harga: json['harga'],
      );
}
