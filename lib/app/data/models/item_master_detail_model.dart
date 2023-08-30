class ItemMasterDetailModel {
  final String idBarang;
  final String slugBarang;
  final String judul;
  final String deskripsi;
  final int harga;
  final int diskon;
  final String berat;
  final bool statusBookNonBook;
  final int hargaPromo;
  final String statusPromo;
  final dynamic statusDiskon;
  final dynamic startPromo;
  final dynamic expiredPromo;
  final List<Gambar> gambar;
  final Kategori kategori;
  final PdfInfo pdfInfo;
  final List<BarangInfo> barangInfo;
  final List<Warehouse> warehouse;
  final bool statusStok;

  ItemMasterDetailModel({
    required this.idBarang,
    required this.slugBarang,
    required this.judul,
    required this.deskripsi,
    required this.harga,
    required this.diskon,
    required this.berat,
    required this.statusBookNonBook,
    required this.hargaPromo,
    required this.statusPromo,
    required this.statusDiskon,
    required this.startPromo,
    required this.expiredPromo,
    required this.gambar,
    required this.kategori,
    required this.pdfInfo,
    required this.barangInfo,
    required this.warehouse,
    required this.statusStok,
  });

  factory ItemMasterDetailModel.fromJson(Map<String, dynamic> json) =>
      ItemMasterDetailModel(
        idBarang: json['id_barang'],
        slugBarang: json['slug_barang'],
        judul: json['judul'],
        deskripsi: json['deskripsi'],
        harga: json['harga'],
        diskon: json['diskon'],
        berat: json['berat'],
        statusBookNonBook: json['status_book_non_book'],
        hargaPromo: json['harga_promo'],
        statusPromo: json['status_promo'],
        statusDiskon: json['status_diskon'],
        startPromo: json['start_promo'],
        expiredPromo: json['expired_promo'],
        gambar:
            List<Gambar>.from(json['gambar'].map((x) => Gambar.fromJson(x))),
        kategori: Kategori.fromJson(json['kategori']),
        pdfInfo: PdfInfo.fromJson(json['pdf_info']),
        barangInfo: List<BarangInfo>.from(
            json['barang_info'].map((x) => BarangInfo.fromJson(x))),
        warehouse: List<Warehouse>.from(
            json['warehouse'].map((x) => Warehouse.fromJson(x))),
        statusStok: json['status_stok'],
      );

  Map<String, dynamic> toJson() => {
        'id_barang': idBarang,
        'slug_barang': slugBarang,
        'judul': judul,
        'deskripsi': deskripsi,
        'harga': harga,
        'diskon': diskon,
        'berat': berat,
        'status_book_non_book': statusBookNonBook,
        'harga_promo': hargaPromo,
        'status_promo': statusPromo,
        'status_diskon': statusDiskon,
        'start_promo': startPromo,
        'expired_promo': expiredPromo,
        'gambar': List<dynamic>.from(gambar.map((x) => x.toJson())),
        'kategori': kategori.toJson(),
        'pdf_info': pdfInfo.toJson(),
        'barang_info': List<dynamic>.from(barangInfo.map((x) => x.toJson())),
        'warehouse': List<dynamic>.from(warehouse.map((x) => x.toJson())),
        'status_stok': statusStok,
      };
}

class BarangInfo {
  final String label;
  final String value;

  BarangInfo({
    required this.label,
    required this.value,
  });

  factory BarangInfo.fromJson(Map<String, dynamic> json) => BarangInfo(
        label: json['label'],
        value: json['value'],
      );

  Map<String, dynamic> toJson() => {
        'label': label,
        'value': value,
      };
}

class Gambar {
  final String gambar;

  Gambar({
    required this.gambar,
  });

  factory Gambar.fromJson(Map<String, dynamic> json) => Gambar(
        gambar: json['gambar'],
      );

  Map<String, dynamic> toJson() => {
        'gambar': gambar,
      };
}

class Kategori {
  final String idKategori;
  final String namaKategori;

  Kategori({
    required this.idKategori,
    required this.namaKategori,
  });

  factory Kategori.fromJson(Map<String, dynamic> json) => Kategori(
        idKategori: json['id_kategori'],
        namaKategori: json['nama_kategori'],
      );

  Map<String, dynamic> toJson() => {
        'id_kategori': idKategori,
        'nama_kategori': namaKategori,
      };
}

class PdfInfo {
  final String statusPdfGooglePlay;
  final String linkPdfGooglePlay;

  PdfInfo({
    required this.statusPdfGooglePlay,
    required this.linkPdfGooglePlay,
  });

  factory PdfInfo.fromJson(Map<String, dynamic> json) => PdfInfo(
        statusPdfGooglePlay: json['status_pdf_google_play'],
        linkPdfGooglePlay: json['link_pdf_google_play'],
      );

  Map<String, dynamic> toJson() => {
        'status_pdf_google_play': statusPdfGooglePlay,
        'link_pdf_google_play': linkPdfGooglePlay,
      };
}

class Warehouse {
  final String idcabang;
  final String namaCabang;
  final String alamatCabang;
  final int qtyStok;

  Warehouse({
    required this.idcabang,
    required this.namaCabang,
    required this.alamatCabang,
    required this.qtyStok,
  });

  factory Warehouse.fromJson(Map<String, dynamic> json) => Warehouse(
        idcabang: json['idcabang'],
        namaCabang: json['nama_cabang'],
        alamatCabang: json['alamat_cabang'],
        qtyStok: json['qty_stok'],
      );

  Map<String, dynamic> toJson() => {
        'idcabang': idcabang,
        'nama_cabang': namaCabang,
        'alamat_cabang': alamatCabang,
        'qty_stok': qtyStok,
      };
}
