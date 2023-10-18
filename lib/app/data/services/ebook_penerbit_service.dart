import 'package:andipublisher/app/data/models/ebook_penerbit_model.dart';
import 'package:andipublisher/app/data/services/main_service.dart';

class EbookPenerbitService {
  static Future<List<EbookPenerbitModel>> getListPenerbit({
    required int limit,
    required int offset,
  }) async {
    final Map<String, String> body = {
      'limit': limit.toString(),
      'offset': offset.toString(),
    };

    final result = await MainService().getAPI(url: 'ebook/penerbit', body: body);

    if (result['status'] == true) {
      final List<dynamic> penerbitData = result['data']['list'];
      final List<EbookPenerbitModel> penerbitList = penerbitData
          .map((penerbitData) => EbookPenerbitModel.fromJson(penerbitData))
          .toList();
      return penerbitList;
    } else {
      // Handle the case when the request is not successful.
      throw Exception('Failed to load penerbit');
    }
  }
}
