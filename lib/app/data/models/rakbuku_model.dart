class RakBukuModel {
  final String idRak;
  final DateTime rakCreatedAt;
  final bool isLoaned;
  final List<String> rakEnd;
  final String idEbook;
  final String judul;
  final String deskripsi;
  final String tahun;
  final String gambar1;
  final String file;

  RakBukuModel({
    required this.idRak,
    required this.rakCreatedAt,
    required this.isLoaned,
    required this.rakEnd,
    required this.idEbook,
    required this.judul,
    required this.deskripsi,
    required this.tahun,
    required this.gambar1,
    required this.file,
  });

  factory RakBukuModel.fromJson(Map<String, dynamic> json) => RakBukuModel(
        idRak: json["idRak"],
        rakCreatedAt: DateTime.parse(json["rak_created_at"]),
        isLoaned: json["isLoaned"],
        rakEnd: List<String>.from(json["rak_end"]),
        idEbook: json["id_ebook"],
        deskripsi: json['deskripsi'],
        judul: json["judul"],
        tahun: json["tahun"],
        gambar1: json["gambar1"],
        file: json["file"],
      );

  Map<String, dynamic> toMap() => {
        "idRak": idRak,
        "rak_created_at": rakCreatedAt.toIso8601String(),
        "isLoaned": isLoaned,
        "rak_end": rakEnd,
        "id_ebook": idEbook,
        "judul": judul,
        'deskripsi' : deskripsi,
        "tahun": tahun,
        "gambar1": gambar1,
        "file": file,
      };
}
