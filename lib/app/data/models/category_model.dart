class CategoryModel {
  final String idKategori;
  final String namaKategori;
  final String countBook;
  final String icon;

  CategoryModel(
      {required this.idKategori,
      required this.namaKategori,
      required this.countBook,
      required this.icon});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
        idKategori: json['kode_kategori'],
        namaKategori: json['nama_kategori'],
        countBook: json['jml'],
        icon: json['icon'] ?? '');
  }
}
