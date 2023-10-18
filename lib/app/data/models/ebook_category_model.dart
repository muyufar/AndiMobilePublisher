class EbookCategoryModel {
  final String idKategori;
  final String namaKategori;
  final String totalChild;
  final String isHasChild;
  final String icon;
  bool isExpanded;

  EbookCategoryModel(
      {required this.idKategori,
      required this.namaKategori,
      required this.isHasChild,
      required this.totalChild,
      required this.icon,
      this.isExpanded = false,});
      

  factory EbookCategoryModel.fromJson(Map<String, dynamic> json) {
    return EbookCategoryModel(
        idKategori: json['id_kategori'],
        namaKategori: json['nama_kategori'],
        totalChild: json['totalChild'],
        icon: json['icon'],
        isHasChild: json['isHasChild'] ?? '');
  }
}
