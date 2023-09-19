import 'package:andipublisher/app/data/models/checkout_ebook_model.dart';
import 'package:andipublisher/app/data/models/data_ebook_checkout_model.dart';
import 'package:andipublisher/app/data/models/detail_history_transaction_model.dart';
import 'package:andipublisher/app/data/models/list_history_transaction_model.dart';
import 'package:andipublisher/app/data/models/payment_ebook_model.dart';
import 'package:andipublisher/app/data/models/voucher_model.dart'; // Import model voucher
import 'package:andipublisher/app/data/services/main_service.dart';

class TransactionEbookService {
  static Future<CheckoutEbookModel> postCheckout(
      {required String tag, required List<String> ids}) async {
    Map<String, dynamic> body = {
      'tag': tag,
      'idUser': MainService().utilsController.userModel.idUser,
    };
    for (int i = 0; i < ids.length; i++) {
      body.addAll({'id[$i]': ids[i]});
    }

    final result = await MainService()
        .postAPI(url: 'transaction/checkout/ebook', body: body);

    return CheckoutEbookModel.fromJson(result['data']);
  }

  static Future<PaymentEbookModel> postPayment({
    required bool usePoinUser,
    required bool isVoucher,
    required List<DataEbookCheckoutMolde> dataEbookCheckout,
  }) async {
    // Dapatkan idUser dari eBook checkout
    // final String idUser = dataEbookCheckout;

    // // Dapatkan idEbook dari eBook checkout
    // final String idEbook =
    //     dataEbookCheckout.dataEbookCheckout[0].products[0].idProduct;

    DataEbookCheckoutModel body = DataEbookCheckoutModel(
      user: User(
        idUser: MainService().utilsController.userModel.idUser,
        usePoinUser: usePoinUser,
      ),
      voucher: VoucherEbook(
        isVoucher: true,
        name: "Masukan Kode Voucher",
        code: "########",
        minimalTransaction: 0,
        beli: Discounte(harga: 0, persen: 0),
        sewa: Discounte(harga: 0, persen: 0),
        end: "2023-09-30 11:52:00",
      ),
      dataEbookCheckout: dataEbookCheckout,
    );

    final result = await MainService()
        .postAPIBodyRaw(url: 'Transaction/transaction', body: body.toJson());

    return PaymentEbookModel.fromJson(result['data']);
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
