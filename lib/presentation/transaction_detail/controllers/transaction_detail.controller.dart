import 'package:andipublisher/app/data/models/detail_history_transaction_model.dart';
import 'package:andipublisher/app/data/models/payment_model.dart';
import 'package:andipublisher/app/data/services/transaction_service.dart';
import 'package:andipublisher/infrastructure/navigation/routes.dart';
import 'package:get/get.dart';

class TransactionDetailController extends GetxController {
  Rxn<DetailHistoryTransactionModel> detailHistoryTransactionModel =
      Rxn<DetailHistoryTransactionModel>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<DetailHistoryTransactionModel> fetchDetailTransaction() async {
    detailHistoryTransactionModel.value =
        await TransactionService.getDetailHistoryTransaction(
            idTransaksi: Get.arguments);

    return detailHistoryTransactionModel.value!;
  }

  void onTapPayNaw() {
    PaymentModel paymentModel = PaymentModel(
        idtransaksiNew: '',
        idTransaksiLama: '',
        tanggalTransaksi: DateTime.now(),
        keterangan: '',
        jenisTransaksi: '',
        iduser: '',
        subTotal: 0,
        discTotal: 0,
        grandTotal: 0,
        idcabang: '',
        status: true,
        id: '',
        token: '',
        url: detailHistoryTransactionModel.value?.transaksi.paymentRedirect ??
            '');

    Get.toNamed(Routes.PAYMENT, arguments: paymentModel);
  }
}
