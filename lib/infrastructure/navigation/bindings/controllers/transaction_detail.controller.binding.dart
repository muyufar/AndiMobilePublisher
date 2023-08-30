import 'package:get/get.dart';

import '../../../../presentation/transaction_detail/controllers/transaction_detail.controller.dart';

class TransactionDetailControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransactionDetailController>(
      () => TransactionDetailController(),
    );
  }
}
