import 'package:andipublisher/app/data/models/ebook_search_model.dart';
import 'package:andipublisher/app/data/services/main_service.dart';

class EbookSearchService {
  static Future<List<EbookSearchModel>> getEbookSearch(
    {String tag = 'search', String offset = '0', String q = ''}) async {
      final result = await MainService().getAPI(url: 'ebook/list', body: {'tag': tag, 'offset': offset, 'limit' : '10', 'q':q});
      return List<EbookSearchModel>.from(result['data']['value'].map((e) => EbookSearchModel.fromJson(e)));
    }
}