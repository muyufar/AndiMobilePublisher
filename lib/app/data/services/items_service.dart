import 'package:andipublisher/app/data/models/item_master_detail_model.dart';
import 'package:andipublisher/app/data/models/label_items_master_model.dart';
import 'package:andipublisher/app/data/services/main_service.dart';

class ItemsService {
  static Future<LabelItemsMasterModel> getItemsMaster(
      {required String link}) async {
    final result = await MainService().getAPI(url: 'ItemsMaster/$link');
    return LabelItemsMasterModel.fromJson(result['data']);
  }

  static Future<ItemMasterDetailModel> getItemMasterDetail(
      {required String id}) async {
    final result = await MainService()
        .getAPI(url: 'ItemsMaster/detail', body: {'idBarang': id});
    return ItemMasterDetailModel.fromJson(result['data']);
  }
}
