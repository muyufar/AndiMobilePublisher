import 'package:andipublisher/app/data/models/ebook_category_model.dart';
import 'package:andipublisher/app/data/services/main_service.dart';

class EbookCategoryService {
  static Future<List<EbookCategoryModel>> getListCategories({
    required int limit,
    required int offset,
  }) async {
    final Map<String, String> body = {
      'limit': limit.toString(),
      'offset': offset.toString(),
    };

    final result = await MainService().getAPI(url: 'ebook/category', body: body);

    if (result['status'] == true) {
      final List<dynamic> categoriesData = result['data']['list'];
      final List<EbookCategoryModel> categories = categoriesData
          .map((categoryData) => EbookCategoryModel.fromJson(categoryData))
          .toList();
      return categories;
    } else {
      // Handle the case when the request is not successful.
      throw Exception('Failed to load categories');
    }
  }

  static Future<List<EbookCategoryModel>> getListChildCategories({
    required int limit,
    required int offset,
    required String idParent,
  }) async {
    final Map<String, String> body = {
      'limit': limit.toString(),
      'offset': offset.toString(),
      'idParent': idParent,
    };

  final result = await MainService().getAPI(url: 'ebook/category/child', body: body);

    if (result['status'] == true) {
      final List<dynamic> categoriesData = result['data']['list'];
      final List<EbookCategoryModel> categories = categoriesData
          .map((categoryData) => EbookCategoryModel.fromJson(categoryData))
          .toList();
      return categories;
    } else {
      // Handle the case when the request is not successful.
      throw Exception('Failed to load child categories');
    }
  }
}