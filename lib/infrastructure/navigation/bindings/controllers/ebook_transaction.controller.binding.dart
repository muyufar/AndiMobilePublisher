import 'package:get/get.dart';

import '../../../../presentation/ebook_transaction/controllers/ebook_transaction.controller.dart';

class EbookTransactionControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EbookTransactionController>(
      () => EbookTransactionController(),
    );
  }
}
