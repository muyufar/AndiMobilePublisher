class EbookPenerbitModel {
final String idPenerbit;
  final String kodePenerbit;
  final String namaPenerbit;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;
  final String icon;
  final String createdBy;
  final String updatedBy;
  final String? deletedBy;
  final String stShow;
  final String stRemove;
  final String jmlTerjual;

  EbookPenerbitModel(
      {required this.idPenerbit,
    required this.kodePenerbit,
    required this.namaPenerbit,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.icon,
    required this.createdBy,
    required this.updatedBy,
    this.deletedBy,
    required this.stShow,
    required this.stRemove,
    required this.jmlTerjual,});

  factory EbookPenerbitModel.fromJson(Map<String, dynamic> json) {
    return EbookPenerbitModel(
idPenerbit: json['id_penerbit'],
      kodePenerbit: json['kode_penerbit'],
      namaPenerbit: json['nama_penerbit'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
      icon: json['icon'],
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
      deletedBy: json['deleted_by'],
      stShow: json['st_show'],
      stRemove: json['st_remove'],
      jmlTerjual: json['jml_terjual'],);
  }
}
