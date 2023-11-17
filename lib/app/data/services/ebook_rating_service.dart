import 'dart:convert';
import 'package:andipublisher/app/data/services/main_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class EbookratingService {
  static Future<String> addRating(
      {required String idTransaksi,
      required String idUser,
      required String idEbook,
      String? Deskripsi,
      required String rating,
      required bool isHide,
      http.Client? client}) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${MainService().urlAPIMain}review/create'));

    request.fields['idUser'] = GetStorage().read('idUser');
    request.fields['idEbook'] = idEbook;
    request.fields['idTransaction'] = idTransaksi;
    request.fields['description'] = Deskripsi ?? '';
    request.fields['isHide'] = isHide.toString();
    request.fields['rating'] = rating.toString();

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);
    Get.back();
    var data = json.decode(response.body);
    return data['data'];
  }
}
