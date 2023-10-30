import 'dart:core';

class EbookMasterDetailModel {
  final String idBarang;
  final int jenisTransaksi; 
  final String slugBarang;
  final String judul;
  final String deskripsi;
  final bool isDisplay;
  final bool isEbook;
  final bool isReady;
  final bool isWishlisted;
  final Harga harga;
  final Diskon diskon;
  final Flashsale flashsale;
  final List<String> images;
  final Kategori kategori;
  final List<Info> info;

  EbookMasterDetailModel({
    required this.idBarang,
    required this.jenisTransaksi,
    required this.slugBarang,
    required this.judul,
    required this.deskripsi,
    required this.isDisplay,
    required this.isEbook,
    required this.isReady,
    required this.isWishlisted,
    required this.harga,
    required this.diskon,
    required this.flashsale,
    required this.images,
    required this.kategori,
    required this.info,
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
        flashsale: Flashsale.fromJson(json['flashsale']),
        images: List<String>.from(json['images']),
        kategori: Kategori.fromJson(json['kategori']),
        info: List<Info>.from(json['info'].map((x) => Info.fromJson(x))),
      );
}

class Harga {
  final int original;
  final int sewa;
  final int total;

  Harga({
    required this.original,
    required this.sewa,
    required this.total,
  });

  factory Harga.fromJson(Map<String, dynamic> json) => Harga(
        original: json['original'],
        sewa: json['sewa'],
        total: json['total'],
      );
}

class Diskon {
  final bool status;
  final int persen;
  final int harga;

  Diskon({
    required this.status,
    required this.persen,
    required this.harga,
  });

  factory Diskon.fromJson(Map<String, dynamic> json) => Diskon(
        status: json['status'],
        persen: json['persen'],
        harga: json['harga'],
      );
}

class Flashsale {
  final bool status;
  final int harga;
  final String? start;
  final String? end;

  Flashsale({
    required this.status,
    required this.harga,
    this.start,
    this.end,
  });

  factory Flashsale.fromJson(Map<String, dynamic> json) => Flashsale(
        status: json['status'],
        harga: json['harga'],
        start: json['start'],
        end: json['end'],
      );
}

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
