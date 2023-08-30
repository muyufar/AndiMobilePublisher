import 'package:get/get.dart';

import '../../../../presentation/transaction/controllers/transaction.controller.dart';

class TransactionControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransactionController>(
      () => TransactionController(),
    );
  }
}
