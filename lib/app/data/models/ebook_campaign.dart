class EbookCampaign {
  final String id;
  final String label;
  final String deskripsi;
  final String jenis;
  final String tipeTransaksi;
  final String startDate;
  final String endDate;
  final String createdAt;
  final String updatedAt;
  final String? deleteAt;
  final List<EbookCampaignValue> value;

  EbookCampaign({
    required this.id,
    required this.label,
    required this.deskripsi,
    required this.jenis,
    required this.tipeTransaksi,
    required this.startDate,
    required this.endDate,
    required this.createdAt,
    required this.updatedAt,
    this.deleteAt,
    required this.value,
  });

  factory EbookCampaign.fromJson(Map<String, dynamic> json) {
    final List<dynamic> valueList = json['value'];
    final List<EbookCampaignValue> campaignValueList = valueList
        .map((value) => EbookCampaignValue.fromJson(value))
        .toList();

    return EbookCampaign(
      id: json['id'],
      label: json['label'],
      deskripsi: json['deskripsi'],
      jenis: json['jenis'],
      tipeTransaksi: json['tipe_transaksi'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      createdAt: json['created_at'],
      updatedAt: json['update_at'],
      deleteAt: json['delete_at'],
      value: campaignValueList,
    );
  }
}

class EbookCampaignValue {
  final String idBarang;
  final String slugBarang;
  final String gambar1;
  final String judul;
  final String diskon;
  final String harga;
  final String hargaAsli;

  EbookCampaignValue({
    required this.idBarang,
    required this.slugBarang,
    required this.gambar1,
    required this.judul,
    required this.diskon,
    required this.harga,
    required this.hargaAsli,
  });

  factory EbookCampaignValue.fromJson(Map<String, dynamic> json) {
    return EbookCampaignValue(
      idBarang: json['id_barang'],
      slugBarang: json['slug_barang'],
      gambar1: json['gambar1'],
      judul: json['judul'],
      diskon: json['diskon'],
      harga: json['harga'],
      hargaAsli: json['harga_asli'],
    );
  }
}
