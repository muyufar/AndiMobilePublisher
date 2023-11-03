import 'package:andipublisher/app/data/models/ebook_master_model.dart';

class EbookCampaign {
  final String id;
  final String label;
  final String deskripsi;
  final String jenis;
  final int tipeTransaksi;
  final String startDate;
  final String endDate;
  final String createdAt;
  final String updatedAt;
  final String? deleteAt;
  final List<EbookMasterModel> value; 

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

  factory EbookCampaign.fromJson(Map<String, dynamic> json) =>
  EbookCampaign(
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
      value:  List<EbookMasterModel>.from(
            ((json['value'] != null) ? json['value'] : [])
                .map((e) => EbookMasterModel.fromJson(e))),
      );
}
