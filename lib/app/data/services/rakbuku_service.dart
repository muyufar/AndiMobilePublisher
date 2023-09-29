// rakbuku_service.dart
import 'dart:convert';
import 'package:andipublisher/app/data/models/rakbuku_model.dart';
import 'package:andipublisher/app/data/services/main_service.dart';
import 'package:andipublisher/app/controllers/utils_controller.dart';

class RakBukuService {
  static Future<List<RakBukuModel>> getRakbuku(int tag, String idUser) async {
    final result = await MainService().getAPI(
        url: 'ebook/owned?idUser=$idUser&tag=$tag');

    final dataList = result['data'] as List<dynamic>;

    // Mengonversi List<dynamic> menjadi List<RakBukuModel>
    final rakBukuList = dataList.map((data) => RakBukuModel.fromJson(data)).toList();

    return rakBukuList;
  }
}
