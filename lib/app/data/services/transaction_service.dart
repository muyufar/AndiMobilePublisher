import 'package:andipublisher/app/data/models/checkout_model.dart';
import 'package:andipublisher/app/data/models/data_checkout_model.dart';
import 'package:andipublisher/app/data/models/detail_history_transaction_model.dart';
import 'package:andipublisher/app/data/models/list_history_transaction_model.dart';
import 'package:andipublisher/app/data/models/payment_model.dart';
import 'package:andipublisher/app/data/services/main_service.dart';

class TransactionService {
  static Future<CheckoutModel> postCheckout(
      {required String tag,
      required List<String> ids,
      String? idCabang,
      int? quantityOrderDireck}) async {
    Map<String, dynamic> body = {
      'tag': tag,
      'idUser': MainService().utilsController.userModel.idUser,
      'idCabang': idCabang,
      'quantityOrderDireck': quantityOrderDireck.toString(),
    };

    for (int i = 0; i < ids.length; i++) {
      body.addAll({'id[$i]': ids[i]});
    }

    final result =
        await MainService().postAPI(url: 'Transaction/checkout', body: body);

    return CheckoutModel.fromJson(result['data']);
  }

  static Future<PaymentModel> postPayment({
    required String idAddressUser,
    required bool usePoinUser,
    String? idVoucherProduct,
    String? idVoucherCourier,
    required List<DataCheckoutMolde> dataCheckout,
  }) async {
    DataCheckoutModel body = DataCheckoutModel(
        user: User(
          idUser: MainService().utilsController.userModel.idUser,
          idAddressUser: idAddressUser,
          usePoinUser: usePoinUser,
        ),
        voucher: Voucher(
            idVoucherProduct: idVoucherProduct,
            idVoucherCourier: idVoucherCourier),
        dataCheckout: dataCheckout);

    final result = await MainService()
        .postAPIBodyRaw(url: 'Transaction/transaction', body: body.toJson());

    return PaymentModel.fromJson(result['data']);
  }

  static Future<List<ListHistoryTransactionModel>> getListHistoryTransaction(
      {required String tag, required String offset}) async {
    Map<String, String> body = {
      'tag': tag,
      'offset': offset,
      'limit': '10',
      'idUser': MainService().utilsController.userModel.idUser,
    };

    final result = await MainService()
        .getAPI(url: 'Transaction/historyTransaction', body: body);

    return List<ListHistoryTransactionModel>.from(
        ((result != null) ? result['data'] : [])
            .map((e) => ListHistoryTransactionModel.fromJson(e)));
  }

  static Future<DetailHistoryTransactionModel> getDetailHistoryTransaction(
      {required String idTransaksi}) async {
    Map<String, dynamic> body = {
      'idTransaksi': idTransaksi,
      'idUser': MainService().utilsController.userModel.idUser,
    };

    final result = await MainService()
        .getAPI(url: 'Transaction/historyTransaction', body: body);

    return DetailHistoryTransactionModel.fromJson(result['data']);
  }
}
