import 'dart:core';

class EbookMasterDetailModel {
  String idBarang;
  int jenisTransaksi;
  String slugBarang;
  String judul;
  String deskripsi;
  bool isDisplay;
  bool isEbook;
  bool isReady;
  bool isWishlisted;
  Harga? harga;
  Diskon? diskon;
  List<String> images;
  Kategori? kategori;
  List<Info> info;
  String rating;
  Review? isReviewAble;
  BukudiBeli? isInBookShelf;

  EbookMasterDetailModel({
    this.idBarang = '',
    this.jenisTransaksi = 0,
    this.slugBarang = '',
    this.judul = '',
    this.deskripsi = '',
    this.isDisplay = false,
    this.isEbook = false,
    this.isReady = false,
    this.isWishlisted = false,
    this.harga,
    this.diskon,
    this.images = const [],
    this.kategori,
    this.info = const [],
    this.rating = '',
    this.isReviewAble,
    this.isInBookShelf,
  });

  factory EbookMasterDetailModel.fromJson(Map<String, dynamic> json) =>
      EbookMasterDetailModel(
        idBarang: json['id_barang'],
        jenisTransaksi: json['jenis_transaksi'],
        slugBarang: json['slug_barang'],
        judul: json['judul'],
        deskripsi: json['deskripsi'],
        isDisplay: json['isDisplay'],
        isEbook: json['isEbook'],
        isReady: json['isReady'],
        isWishlisted: json['isWishlisted'],
        harga: Harga.fromJson(json['harga']),
        diskon: Diskon.fromJson(json['diskon']),
        images: List<String>.from(json['images']),
        kategori: Kategori.fromJson(json['kategori']),
        info: List<Info>.from(json['info'].map((x) => Info.fromJson(x))),
        rating: json["rating"],
        isReviewAble: Review.fromJson(json['isReviewAble']),
        isInBookShelf: BukudiBeli.fromJson(json['isInBookShelf']),
      );
}

class Harga {
  final int original;
  final int sewa;
  final int total;

  Harga({
    this.original = 0,
    this.sewa = 0,
    this.total = 0,
  });

  factory Harga.fromJson(Map<String, dynamic> json) => Harga(
        original: json['original'],
        sewa: json['sewa'],
        total: json['total'],
      );
}

class BukudiBeli {
  final bool owned;
  final bool loaned;

  BukudiBeli({
    this.owned = false,
    this.loaned = false,
  });

  factory BukudiBeli.fromJson(Map<String, dynamic> json) => BukudiBeli(
        owned: json['owned'],
        loaned: json['loaned'],
      );
}

class Review{
  final String? idTransaction;
  final String? id;
  final bool? status;

  Review({
    this.idTransaction,
    this.id,
    this.status = false,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    idTransaction: json['idTransaction'],
    id: json['id'],
    status: json['status'],
  );
}
class Diskon {
  final bool status;
  final int persen;
  final int harga;

  Diskon({
    this.status = false,
    this.persen = 0,
    this.harga = 0,
  });

  factory Diskon.fromJson(Map<String, dynamic> json) => Diskon(
        status: json['status'],
        persen: json['persen'],
        harga: json['harga'],
      );
}

// class Flashsale {
//   final bool status;
//   final int harga;
//   final String? start;
//   final String? end;

//   Flashsale({
//     required this.status,
//     required this.harga,
//     this.start,
//     this.end,
//   });

//   factory Flashsale.fromJson(Map<String, dynamic> json) => Flashsale(
//         status: json['status'],
//         harga: json['harga'],
//         start: json['start'] ?? '',
//         end: json['end'] ?? '',
//       );
// }

class Kategori {
  final String id;
  final String label;

  Kategori({
    required this.id,
    required this.label,
  });

  factory Kategori.fromJson(Map<String, dynamic> json) => Kategori(
        id: json['id'],
        label: json['label'],
      );
}

class Info {
  final String label;
  final String value;

  Info({
    required this.label,
    required this.value,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        label: json['label'],
        value: json['value'],
      );
}
