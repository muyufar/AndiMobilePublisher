class EbookRatingModel {
   final bool status;
  final String message;
  final EbookRatingData? data;

  EbookRatingModel({
    this.status = false,
    this.message = '',
    this.data,
  });

   factory EbookRatingModel.fromJson(Map<String, dynamic> json) {
    return EbookRatingModel(
      status: json['status'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      data: json['data'] != null
          ? EbookRatingData.fromJson(json['data'] as Map<String, dynamic>)
          : null,
    );
  }
}

class EbookRatingData {
  final String? totals;
  final int? jumlah;
  final List<EbookRatingItem>? list;

  EbookRatingData({
     this.totals,
     this.jumlah,
     this.list,
  });

  factory EbookRatingData.fromJson(Map<String, dynamic> json) {
    return EbookRatingData(
      totals: json['totals'] as String,
      jumlah: json['jumlah'] as int,
      list: List<EbookRatingItem>.from(
        (json['list'] as List).map(
          (item) => EbookRatingItem.fromJson(item as Map<String, dynamic>),
        ),
      ),
    );
  }
}

class EbookRatingItem {
  final String idReview;
  final String namaUser;
  final String idUser;
  final String value;
  final String description;
  final DateTime? createdAt;
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
      idReview: json['idReview'] as String,
      namaUser: json['nama_user'] as String,
      idUser: json['id_user'] as String,
      value: json['value'] as String,
      description: json['description'] as String,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
      likes: json['likes'] as int,
      isNameHidden: json['isNameHidden'] as bool,
    );
  }
}
