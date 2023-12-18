class EbookCategoryModel {
  final String idKategori;
  final String namaKategori;
  final int totalChild;
  final int isHasChild;
  final String icon;
  bool isExpanded;
  final int? jumlah;

  EbookCategoryModel({
    required this.idKategori,
    required this.namaKategori,
    required this.isHasChild,
    required this.totalChild,
    required this.icon,
    this.isExpanded = false,
    this.jumlah,
  });

  factory EbookCategoryModel.fromJson(Map<String, dynamic> json) {
    return EbookCategoryModel(
      idKategori: json['id_kategori'],
      namaKategori: json['nama_kategori'],
      totalChild: json['totalChild'] != null ? int.parse(json['totalChild'].toString()) : 0,
      icon: json['icon'],
      isHasChild: json['isHasChild'] != null ? int.parse(json['isHasChild'].toString()) : 0,
      jumlah: json['jumlah'],
    );
  }
}
