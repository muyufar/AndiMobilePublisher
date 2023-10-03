import 'package:andipublisher/app/data/models/checkout_ebook_model.dart';
import 'package:andipublisher/app/data/models/data_ebook_checkout_model.dart';
import 'package:andipublisher/app/data/models/detail_history_transaction_model.dart';
import 'package:andipublisher/app/data/models/ebook_detail_history_transaction_model.dart';
import 'package:andipublisher/app/data/models/ebook_list_history_transaction_model.dart';
import 'package:andipublisher/app/data/models/payment_ebook_model.dart';
import 'package:andipublisher/app/data/services/main_service.dart';

class TransactionEbookService {
  static Future<CheckoutEbookModel> postCheckout({
    required String tag,
    required List<String> ids,
    required String voucherCode,
  }) async {
    Map<String, dynamic> body = {
      'tag': tag,
      'idUser': MainService().utilsController.userModel.idUser,
      'voucherCode': voucherCode,
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
    bool isVoucher = false,
    String voucherCode = "",
    //bool? isVoucher,
    // String? name,
    // String? code,
    //int? minimalTransaction,
    // Discounte? beli,
    //Discounte? sewa,
    //String? end,

    required List<DataEbookCheckoutMolde> dataEbookCheckout,
  }) async {
    DataEbookCheckoutModel body = DataEbookCheckoutModel(
      user: User(
        idUser: MainService().utilsController.userModel.idUser,
        usePoinUser: usePoinUser,
      ),
      kodeVoucher: voucherCode,
      // voucher: VoucherEbook(
      //   isVoucher: isVoucher,
      // voucherCode: voucherCode,

      //name: name,
      // code: code,
      //minimalTransaction: minimalTransaction,
      //beli: beli,
      // sewa: sewa,
      //end: end,
      // ),
      dataEbookCheckout: dataEbookCheckout,
    );

    final result = await MainService()
        .postAPIBodyRaw(url: 'transaction/ebook', body: body.toJson());

    return PaymentEbookModel.fromJson(result['data']);
  }

  static Future<List<EbookListHistoryTransactionModel>> getListHistoryTransaction(
      {required String tag, required String offset}) async {
    Map<String, String> body = {
      'tag': tag,
      'offset': offset,
      'limit': '10',
      'idUser': MainService().utilsController.userModel.idUser,
    };

    final result = await MainService()
        .getAPI(url: 'transaction/history/ebook', body: body);

    return List<EbookListHistoryTransactionModel>.from(
        ((result != null) ? result['data'] : [])
            .map((e) => EbookListHistoryTransactionModel.fromJson(e)));
  }

  static Future<EbookDetailHistoryTransactionModel> ebookgetDetailHistoryTransaction(
      {required String idTransaksi}) async {
         Map<String, dynamic> body = {
      'idUser': MainService().utilsController.userModel.idUser,
      'idTransaksi': idTransaksi};
       print('Request Body: $body');
      
   final result = await MainService()
        .getAPI(url: 'Transaction/detail',body: body);
print('Response Data: $result');
    return EbookDetailHistoryTransactionModel.fromJson(result['data']);
   
  }
}
