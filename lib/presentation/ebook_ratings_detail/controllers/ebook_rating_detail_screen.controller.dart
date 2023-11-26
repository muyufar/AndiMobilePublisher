import 'package:andipublisher/app/data/models/ebook_detail_history_transaction_model.dart';
import 'package:andipublisher/app/data/services/transaction_ebook_service.dart';
import 'package:get/get.dart';

class EbookRatingTransactionDetailScreenController extends GetxController {
  //TODO: Implement EbookPrimaryRatingsDetailScreenController
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

}
