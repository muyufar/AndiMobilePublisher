import 'package:andipublisher/app/controllers/utils_controller.dart';
import 'package:andipublisher/app/data/models/ebook_detail_history_transaction_model.dart';
import 'package:andipublisher/app/data/models/payment_ebook_model.dart';
import 'package:andipublisher/app/data/services/transaction_ebook_service.dart';
import 'package:andipublisher/infrastructure/navigation/routes.dart';
import 'package:get/get.dart';

class EbookTransactionDetailController extends GetxController {
  final UtilsController utilsController = Get.find();
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

Future<EbookDetailHistoryTransactionModel?> fetchDetailTransaction() async {
  if (ebookdetailHistoryTransactionModel.value != null) {
    ebookdetailHistoryTransactionModel.value =
        (await TransactionEbookService.getDetailHistoryTransaction(
            idInvoice: Get.arguments,
            idUser: utilsController.userModel.idUser)) as EbookDetailHistoryTransactionModel?;
    return ebookdetailHistoryTransactionModel.value!;
  } else {
    // Lakukan penanganan kesalahan jika diperlukan
    print("Model detail transaksi tidak tersedia.");
    return null;
  }
}


  void onTapPayNow() {
    final paymentRedirectUrl =
        ebookdetailHistoryTransactionModel.value?.transaksi.paymentRedirect;

    if (paymentRedirectUrl != null && paymentRedirectUrl.isNotEmpty) {
      final ebookpaymentModel = PaymentEbookModel(
        idtransaksiNew: '',
        isUseMidtrans: true,
        idTransaksiLama: '',
        tanggalTransaksi: DateTime.now(),
        keterangan: '',
        jenisTransaksi: '',
        iduser: '',
        voucherCode: true,
        subTotal: 0,
        discTotal: 0,
        grandTotal: 0,
        status: true,
        id: '',
        token: '',
        url: paymentRedirectUrl,
      );

      Get.toNamed(Routes.PAYMENT_EBOOK, arguments: ebookpaymentModel);
    } else {
      print('Payment redirect URL is empty or null.');
    }
  }
}
