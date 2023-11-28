import 'package:andipublisher/app/data/models/ebook_master_detail_model.dart';
import 'package:andipublisher/app/data/models/label_ebook_master_model.dart';
import 'package:andipublisher/app/data/services/main_service.dart';

class EbookService {
  static Future<LabelEbookMasterModel> getEbookItemsMaster(
      {required String link}) async {
    print('link:$link');
    final result = await MainService().getAPI(url: 'ebook/$link');
    return LabelEbookMasterModel.fromJson(result['data']);
  }

  static Future<EbookMasterDetailModel> getEbookItemMasterDetail(
      {required String id}) async {
    final result = await MainService().getAPI(url: 'ebook', body: {'id': id});
    return EbookMasterDetailModel.fromJson(result['data']);
  }
}
