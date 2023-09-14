import 'package:get/get.dart';

import '../../../../presentation/checkout_ebook/controllers/checkout_ebook.controller.dart';

class CheckoutEbookControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckoutEbookController>(
      () => CheckoutEbookController(),
    );
  }
}
