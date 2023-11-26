import 'dart:convert';
import 'package:andipublisher/app/controllers/utils_controller.dart';
import 'package:andipublisher/app/data/models/ebook_detail_history_transaction_model.dart';
import 'package:andipublisher/app/data/models/ebook_list_history_transaction_model.dart';
import 'package:andipublisher/app/data/models/ebook_rating_model.dart';
import 'package:andipublisher/app/data/services/main_service.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class EbookratingService {
  final UtilsController utilsController = Get
      .find(); // Menggunakan Get.find() untuk mendapatkan instance UtilsController
  // String idUser = '';
  static String get idUser => MainService().utilsController.userModel.idUser;

  // @override
  // void onInit() {
  //   idUser = utilsController.userModel.idUser;
  // }

  static Future<List<EbookListHistoryTransactionModel>> getNotRatedList({
    required String tag,
    required String offset,
  }) async {
    Map<String, String> body = {
      'tag': tag,
      'offset': offset,
      'limit': '10',
      'idUser': MainService().utilsController.userModel.idUser,
    };

    final result = await MainService().getAPI(
      url: 'transaction/history/ebook',
      body: body,
    );

    return List<EbookListHistoryTransactionModel>.from(
      (result != null ? result['data'] : []).map(
        (e) => EbookListHistoryTransactionModel.fromJson(e),
      ),
    );
  }

  static Future<EbookDetailHistoryTransactionModel> getDetailNotRatedList({
    required String idTransaksi,
  }) async {
    Map<String, dynamic> body = {
      'idUser': MainService().utilsController.userModel.idUser,
      'idTransaksi': idTransaksi,
    };
    print('Request Body: $body');

    final result = await MainService().getAPI(
      url: 'Transaction/detail',
      body: body,
    );
    print('Response Data: $result');

    return EbookDetailHistoryTransactionModel.fromJson(result['data']);
  }

  static Future<dynamic> addRating({
    required String idTransaksi,
    required String idEbook,
    String? Deskripsi,
    required int rating,
    required bool isHide,
    http.Client? client,
  }) async {
    Map body = {
      'idUser': idUser,
      'idEbook': idEbook,
      'idTransaction': idTransaksi,
      'description': Deskripsi ?? '',
      'isHide': isHide.toString(),
      'rating': rating.toString(),
    };

    final result =
        await MainService().postAPI(url: 'review/create', body: body);
        
  }

  static Future<EbookRatingData> getRatingEbook({
    required String idEbook,
  }) async {
    final result = await MainService().getAPI(
      url: 'review/list',
      body: {'idEbook': idEbook},
    );
    return EbookRatingData.fromJson(result['data']);

  }
}
