import 'package:andipublisher/app/data/models/data_cart_model.dart';
import 'package:andipublisher/app/data/services/main_service.dart';

class EbookCartService {
  static Future<bool> postAddCart({required String idBarang}) async {
    Map<String, String> body = {
      'idBarang': idBarang,
      'idUser': MainService().utilsController.userModel.idUser,
    };

    final result = await MainService().postAPI(url: 'Cart/add', body: body);

    return result['status'];
  }

  static Future<String> getCartCount() async {
    Map<String, dynamic> body = {
      'idUser': MainService().utilsController.userModel.idUser,
    };

    final result = await MainService().getAPI(url: 'Cart/count', body: body);

    return result['data'] ?? '';
  }

  static Future<List<DataCartModel>> getDataListCart() async {
    Map<String, dynamic> body = {
      'idUser': MainService().utilsController.userModel.idUser,
    };

    final result = await MainService().getAPI(url: 'Cart', body: body);

    return List<DataCartModel>.from(((result != null) ? result['data'] : [])
        .map((e) => DataCartModel.fromJson(e)));
  }
}
