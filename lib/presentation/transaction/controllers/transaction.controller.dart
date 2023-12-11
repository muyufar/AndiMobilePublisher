import 'package:andipublisher/app/controllers/utils_controller.dart';
import 'package:andipublisher/app/data/models/list_history_transaction_model.dart';
import 'package:andipublisher/app/data/services/transaction_service.dart';
import 'package:get/get.dart';

/// TransactionController
///
/// This class is a controller for the transaction page.

/// Properties
///
/// * `listUnpaid`: The list of unpaid transaction models.
/// * `listProcessed`: The list of processed transaction models.
/// * `listSend`: The list of send transaction models.
/// * `listDone`: The list of done transaction models.
/// * `listCanceled`: The list of canceled transaction models.

/// Methods
///
/// * `getListUnpaid`: Fetches the list of unpaid transactions.
/// * `getListProcessed`: Fetches the list of processed transactions.
/// * `getListSend`: Fetches the list of send transactions.
/// * `getListDone`: Fetches the list of done transactions.
/// * `getListCanceled`: Fetches the list of canceled transactions.

/// Usage
///
/// To use this class, first you need to import it. Then, you can instantiate it like this:
///
///
/// TransactionController controller = TransactionController();
///
/// This code will instantiate a TransactionController object.

class TransactionController extends GetxController {
  final UtilsController utilsController = Get.put(UtilsController());

  RxList<ListHistoryTransactionModel> listUnpaid =
      RxList<ListHistoryTransactionModel>();
  RxList<ListHistoryTransactionModel> listProcessed =
      RxList<ListHistoryTransactionModel>();
  RxList<ListHistoryTransactionModel> listSend =
      RxList<ListHistoryTransactionModel>();
  RxList<ListHistoryTransactionModel> listDone =
      RxList<ListHistoryTransactionModel>();
  RxList<ListHistoryTransactionModel> listCanceled =
      RxList<ListHistoryTransactionModel>();

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

  Future<List<ListHistoryTransactionModel>> getListUnpaid() async {
    listUnpaid.value = await TransactionService.getListHistoryTransaction(
        tag: '1', offset: '0');
    return listUnpaid;
  }

  Future<List<ListHistoryTransactionModel>> getListProcessed() async {
    listProcessed.value = await TransactionService.getListHistoryTransaction(
        tag: '2', offset: '0');
    return listProcessed;
  }

  Future<List<ListHistoryTransactionModel>> getListSend() async {
    listSend.value = await TransactionService.getListHistoryTransaction(
        tag: '3', offset: '0');
    return listSend;
  }

  Future<List<ListHistoryTransactionModel>> getListDone() async {
    listDone.value = await TransactionService.getListHistoryTransaction(
        tag: '4', offset: '0');
    return listDone;
  }

  Future<List<ListHistoryTransactionModel>> getListCanceled() async {
    listCanceled.value = await TransactionService.getListHistoryTransaction(
        tag: '5', offset: '0');
    return listCanceled;
  }
}
