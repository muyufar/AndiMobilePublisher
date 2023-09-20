import 'package:get/get.dart';

import '../../../../presentation/payment_ebook/controllers/payment_ebook.controller.dart';

class PaymentEbookControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentEbookController>(
      () => PaymentEbookController(),
    );
  }
}
