import 'package:get/get.dart';

import '../../../../presentation/ebook_transaction_detail/controllers/ebook_transaction_detail.controller.dart';

class EbookTransactionDetailControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EbookTransactionDetailController>(
      () => EbookTransactionDetailController(),
    );
  }
}
