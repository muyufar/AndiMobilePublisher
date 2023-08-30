import 'package:andipublisher/app/data/models/courier_model.dart';
import 'package:andipublisher/app/data/services/main_service.dart';

class CourierService {
  static Future<List<CourierModel>> getCourier(
      {required String idCabang,
      required String idAddressUser,
      required int weight}) async {
    Map<String, String> body = {
      'idCabang': idCabang,
      'idAddressUser': idAddressUser,
      'weight': weight.toString()
    };

    final result = await MainService().postAPI(url: 'Courier', body: body);

    return List<CourierModel>.from(((result != null) ? result['data'] : [])
        .map((e) => CourierModel.fromJson(e)));
  }
}
