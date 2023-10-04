import 'package:andipublisher/app/controllers/utils_controller.dart';
import 'package:andipublisher/app/data/models/ebook_detail_history_transaction_model.dart';
import 'package:andipublisher/app/data/models/payment_ebook_model.dart';
import 'package:andipublisher/app/data/services/transaction_ebook_service.dart';
import 'package:andipublisher/infrastructure/navigation/routes.dart';
import 'package:get/get.dart';

class EbookTransactionDetailController extends GetxController {
  // final UtilsController utilsController = Get.find();
  Rxn<EbookDetailHistoryTransactionModel> ebookdetailHistoryTransactionModel =
      Rxn<EbookDetailHistoryTransactionModel>();

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

  Future<EbookDetailHistoryTransactionModel> ebookfetchDetailTransaction() async {
    ebookdetailHistoryTransactionModel.value =
        await TransactionEbookService.ebookgetDetailHistoryTransaction(
            idTransaksi: Get.arguments);
    return ebookdetailHistoryTransactionModel.value!;
  }


  void onTapPayNow() {
      final ebookpaymentModel = PaymentEbookModel(
        // idtransaksiNew: '',
        isUseMidtrans: true,
        idTransaksiLama: '',
        tanggalTransaksi: DateTime.now(),
        keterangan: '',
        jenisTransaksi: '',
        iduser: '',
        // voucherCode: ,
        subTotal: 0,
        discTotal: 0,
        grandTotal: 0,
        status: true,
        id: '',
        token: '',
        url: ebookdetailHistoryTransactionModel.value?.transaksi.paymentRedirect ??
            '');

      Get.toNamed(Routes.PAYMENT_EBOOK, arguments: ebookpaymentModel);
   
  }

}