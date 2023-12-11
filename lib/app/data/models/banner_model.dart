class BannerModel {
  final String idbanner;
  final String namaBanner;
  final String gambarBanner;
   String? linkBanner;
   String? campaignId;
   String? flashSaleId;

  BannerModel({
    required this.idbanner,
    required this.namaBanner,
    required this.gambarBanner,
     this.linkBanner,
     this.campaignId,
     this.flashSaleId,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        idbanner: json['idbanner'],
        namaBanner: json['nama_banner'],
        gambarBanner: json['gambar_banner'],
        linkBanner: json['link_banner'],
        campaignId: json['CampaignId'],
        flashSaleId: json['FlashSaleId'],
      );
}
