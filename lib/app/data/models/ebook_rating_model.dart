class EbookRatingModel {
  final bool status;
  final String message;
  final EbookRatingData data;

  EbookRatingModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory EbookRatingModel.fromJson(Map<String, dynamic> json) {
    return EbookRatingModel(
      status: json['status'],
      message: json['message'],
      data: EbookRatingData.fromJson(json['data']),
    );
  }
}

class EbookRatingData {
  final String totals;
  final int jumlah;
  final List<EbookRatingItem> list;

  EbookRatingData({
    required this.totals,
    required this.jumlah,
    required this.list,
  });

  factory EbookRatingData.fromJson(Map<String, dynamic> json) {
    return EbookRatingData(
      totals: json['totals'],
      jumlah: json['jumlah'],
      list: List<EbookRatingItem>.from(
        json['list'].map((item) => EbookRatingItem.fromJson(item)),
      ),
    );
  }
}

class EbookRatingItem {
  final String idReview;
  final String namaUser;
  final String idUser;
  final String value;
  final String? description;
  final String createdAt;
  final int likes;
  final bool isNameHidden;

  EbookRatingItem({
    required this.idReview,
    required this.namaUser,
    required this.idUser,
    required this.value,
    required this.description,
    required this.createdAt,
    required this.likes,
    required this.isNameHidden,
  });

  factory EbookRatingItem.fromJson(Map<String, dynamic> json) {
    return EbookRatingItem(
      idReview: json['idReview'],
      namaUser: json['nama_user'],
      idUser: json['id_user'],
      value: json['value'],
      description: json['description'],
      createdAt: json['created_at'],
      likes: json['likes'],
      isNameHidden: json['isNameHidden'], // Convert "0" or "1" to boolean
    );
  }
}
