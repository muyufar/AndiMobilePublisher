import 'package:flutter/material.dart';
import 'package:andipublisher/app/data/models/ebook_master_model.dart';

class LabelEbookMasterModel {
  final String label;
  final String link;
  final List<EbookMasterModel> value;

  LabelEbookMasterModel({
    this.label = '',
    this.link = '',
    this.value = const [],
  });

  factory LabelEbookMasterModel.fromJson(Map<String, dynamic> json) {
    List<dynamic>? valueJson = json['value'];
    List<EbookMasterModel>? ebookMasters = valueJson!.map((item) => EbookMasterModel.fromJson(item)).toList();

    return LabelEbookMasterModel(
      label: json['label'],
      link: json['link'],
      value: ebookMasters,
    );
  }
}
