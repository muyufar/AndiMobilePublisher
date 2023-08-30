import 'package:andipublisher/app/data/models/banner_model.dart';
import 'package:andipublisher/app/data/services/main_service.dart';

class BannerService {
  static Future<List<BannerModel>> getBanner() async {
    final result = await MainService().getAPI(url: 'Banner');

    return List<BannerModel>.from(((result != null) ? result['data'] : [])
        .map((e) => BannerModel.fromJson(e)));
  }
}
