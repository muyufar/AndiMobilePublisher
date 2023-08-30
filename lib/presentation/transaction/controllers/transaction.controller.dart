import 'package:andipublisher/app/controllers/utils_controller.dart';
import 'package:andipublisher/app/data/models/list_history_transaction_model.dart';
import 'package:andipublisher/app/data/services/transaction_service.dart';
import 'package:get/get.dart';

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
