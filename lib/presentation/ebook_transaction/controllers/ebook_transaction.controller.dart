import 'package:andipublisher/app/controllers/utils_controller.dart';
import 'package:andipublisher/app/data/models/ebook_list_history_transaction_model.dart';
import 'package:andipublisher/app/data/services/transaction_ebook_service.dart';
import 'package:get/get.dart';

class EbookTransactionController extends GetxController {
    final UtilsController utilsController = Get.put(UtilsController());

  //TODO: Implement EbookTransactionController
RxList<EbookListHistoryTransactionModel> listUnpaid =
      RxList<EbookListHistoryTransactionModel>();
  RxList<EbookListHistoryTransactionModel> listProcessed =
      RxList<EbookListHistoryTransactionModel>();
  RxList<EbookListHistoryTransactionModel> listSend =
      RxList<EbookListHistoryTransactionModel>();
  RxList<EbookListHistoryTransactionModel> listDone =
      RxList<EbookListHistoryTransactionModel>();
  RxList<EbookListHistoryTransactionModel> listCanceled =
      RxList<EbookListHistoryTransactionModel>();
  // final count = 0.obs;
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

  Future<List<EbookListHistoryTransactionModel>> getListUnpaid() async {
    listUnpaid.value = await TransactionEbookService.getListHistoryTransaction(
        tag: '1', offset: '0');
    return listUnpaid;
  }

  Future<List<EbookListHistoryTransactionModel>> getListProcessed() async {
    listProcessed.value = await TransactionEbookService.getListHistoryTransaction(
        tag: '2', offset: '0');
    return listProcessed;
  }

  Future<List<EbookListHistoryTransactionModel>> getListSend() async {
    listSend.value = await TransactionEbookService.getListHistoryTransaction(
        tag: '3', offset: '0');
    return listSend;
  }

  Future<List<EbookListHistoryTransactionModel>> getListDone() async {
    listDone.value = await TransactionEbookService.getListHistoryTransaction(
        tag: '5', offset: '0');
    return listDone;
  }

  Future<List<EbookListHistoryTransactionModel>> getListCanceled() async {
    listCanceled.value = await TransactionEbookService.getListHistoryTransaction(
        tag: '6', offset: '0');
    return listCanceled;
  }
}