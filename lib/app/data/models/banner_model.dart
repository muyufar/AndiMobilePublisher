class BannerModel {
  final String idbanner;
  final String namaBanner;
  final String gambarBanner;
  final String linkBanner;

  BannerModel({
    required this.idbanner,
    required this.namaBanner,
    required this.gambarBanner,
    required this.linkBanner,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        idbanner: json['idbanner'],
        namaBanner: json['nama_banner'],
        gambarBanner: json['gambar_banner'],
        linkBanner: json['link_banner'],
      );
}
