import 'package:andipublisher/app/data/models/category_model.dart';
import 'package:andipublisher/app/data/models/item_master_model.dart';
import 'package:andipublisher/app/data/services/main_service.dart';
import 'package:andipublisher/app/data/models/item_master_detail_model.dart';

class CategoryService {
  static Future<List<CategoryModel>> getCategoryHome() async {
    final result = await MainService().getAPI(url: 'Category.php');
    return List<CategoryModel>.from(
        result.map((e) => CategoryModel.fromJson(e)));
  }

  static Future<List<ItemMasterDetailModel>> getListCetegoryEbook(
      {required String kategori, String limit = '0', String q = ''}) async {
    final result = await MainService().getAPI(url: 'ItemsMaster.php', body: {
      //'tag': 'kategoricari',
      'id_kategori': kategori,
      //'limit': limit,
      //'offset': '15',
    });

    return List<ItemMasterDetailModel>.from(
        result.map((e) => ItemMasterDetailModel.fromJson(e)));
  }

  
}
