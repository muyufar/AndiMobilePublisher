import 'dart:convert';
import 'package:andipublisher/app/data/services/main_service.dart';
import 'package:andipublisher/app/data/models/voucher_model.dart';

class VoucherService {
  static Future<Voucher?> claimVoucher(
      String code, int idEbook, int idUser) async {
    final result = await MainService()
        .getAPI(url: 'claim_get?code=$code&idEbook=$idEbook&idUser=$idUser');

    if (result.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(result.body);
      return Voucher.fromJson(data);
    } else {
      return null;
    }
  }
}
