import 'dart:convert';
import 'package:andipublisher/app/data/models/ebook_detail_history_transaction_model.dart';
import 'package:andipublisher/app/data/models/ebook_list_history_transaction_model.dart';
import 'package:andipublisher/app/data/models/ebook_rating_model.dart';
import 'package:andipublisher/app/data/services/main_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class EbookratingService {

  static Future<List<EbookListHistoryTransactionModel>> getNotRatedList({required String tag,required String offset}
      ) async {
      Map<String, String> body = {
      'tag': tag,
      'offset': offset,
      'limit': '10',
      'idUser': MainService().utilsController.userModel.idUser,
    };

    final result = await MainService()
        .getAPI(url: 'transaction/history/ebook', body: body,);


    return List<EbookListHistoryTransactionModel>.from(
        ((result != null) ? result['data'] : [])
            .map((e) => EbookListHistoryTransactionModel.fromJson(e)));
  }

    static Future<EbookDetailHistoryTransactionModel> getDetailNotRatedList(
      {required String idTransaksi}) async {
         Map<String, dynamic> body = {
      'idUser': MainService().utilsController.userModel.idUser,
      'idTransaksi': idTransaksi};
       print('Request Body: $body');
      
   final result = await MainService()
        .getAPI(url: 'Transaction/detail',body: body);
print('Response Data: $result');
    return EbookDetailHistoryTransactionModel.fromJson(result['data']);
   
  }


  static Future<String> addRating(
      {required String idTransaksi,
      required String idUser,
      required String idEbook,
      String? Deskripsi,
      required String rating,
      required bool isHide,
      http.Client? client}) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${MainService.urlAPIMain}review/create'));

    request.fields['idUser'] = idUser;
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

  static Future<EbookRatingData> getRatingEbook({
    required String idEbook,
  }) async {
    final result = await MainService().getAPI(
      url: 'review/list',
      body: {'idEbook': idEbook},
    );
    return EbookRatingData.fromJson((result['data']));
  }
}
