import 'package:andipublisher/app/data/models/item_master_model.dart';

class LabelItemsMasterModel {
  final String label;
  final String link;
  final List<ItemMasterModel> value;

  LabelItemsMasterModel({
    required this.label,
    required this.link,
    required this.value,
  });

  factory LabelItemsMasterModel.fromJson(Map<String, dynamic> json) =>
      LabelItemsMasterModel(
        label: json['label'],
        link: json['link'],
        value: List<ItemMasterModel>.from(
            ((json['value'] != null) ? json['value'] : [])
                .map((e) => ItemMasterModel.fromJson(e))),
      );
}
