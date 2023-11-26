import 'package:andipublisher/app/data/models/ebook_list_history_transaction_model.dart';
import 'package:andipublisher/app/data/services/ebook_rating_service.dart';
import 'package:get/get.dart';
import 'package:andipublisher/app/controllers/utils_controller.dart';


class EbookRatingController extends GetxController {
    final UtilsController utilsController = Get.put(UtilsController());

  
  RxList<EbookListHistoryTransactionModel> ratingsNotRated = RxList<EbookListHistoryTransactionModel>();
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

    Future<List<EbookListHistoryTransactionModel>> getListNotRated() async {
    ratingsNotRated.value = await EbookratingService.getNotRatedList(
        tag: '5', offset: '0');
    return ratingsNotRated;
  }
   RxInt initPage = 1.obs;
}