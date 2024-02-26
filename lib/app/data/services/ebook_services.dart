import 'package:andipublisher/app/data/models/ebook_master_detail_model.dart';
import 'package:andipublisher/app/data/models/label_ebook_master_model.dart';
import 'package:andipublisher/app/data/services/main_service.dart';

class EbookService {
  static Future<LabelEbookMasterModel> getEbookItemsMaster({
    required String link,
    Map<String, dynamic>? body,
  }) async {
    print('link:$link');
    final result = await MainService().getAPI(
      url: 'ebook/$link',
      body: body,
    );

    if (result != null) {
      Map<String, dynamic> data = result['data'];

      return LabelEbookMasterModel.fromJson(data);
    } else {
      return LabelEbookMasterModel(
        value: List.empty(),
      );
    }
  }

  static Future<EbookMasterDetailModel> getEbookItemMasterDetail(
      {required String id, required String idUser}) async {
    final result = await MainService()
        .getAPI(url: 'ebook', body: {'id': id, 'idUser': idUser});
    return EbookMasterDetailModel.fromJson(result['data']);
  }

  static Future<List<LabelEbookMasterModel>> getallList(
      {String offset = '0', String q = ''}) async {
    final result = await MainService().getAPI(
      url: 'ebook/list',
      body: {
        'tag': 'terbaru',
        'offset': offset,
        'limit': '20',
        'q': q,
      },
    );
    return List<LabelEbookMasterModel>.from(
        result['data'].map((e) => LabelEbookMasterModel.fromJson(e)));
  }
}
