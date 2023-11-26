import 'package:andipublisher/app/data/models/ebook_list_history_transaction_model.dart';
import 'package:get/get.dart';

class EbookRatingController extends GetxController {

  
  RxList<EbookListHistoryTransactionModel> ratingsNotRated = RxList<EbookListHistoryTransactionModel>();
   RxInt initPage = 1.obs;
}