import 'package:andipublisher/app/data/models/ebook_master_model.dart';

class LabelEbookMasterModel {
  final String label;
  final String link;
  final List<EbookMasterModel> value;

  LabelEbookMasterModel({
    required this.label,
    required this.link,
    required this.value,
  });

  factory LabelEbookMasterModel.fromJson(Map<String, dynamic> json) =>
      LabelEbookMasterModel(
        label: json['label'],
        link: json['link'],
        value: List<EbookMasterModel>.from(
            ((json['value'] != null) ? json['value'] : [])
                .map((e) => EbookMasterModel.fromJson(e))),
      );
}
