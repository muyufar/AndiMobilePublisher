import 'package:get/get.dart';

import '../../../../presentation/main_transaction/controllers/main_transaction.controller.dart';

class MainTransactionControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainTransactionController>(
      () => MainTransactionController(),
    );
  }
}
