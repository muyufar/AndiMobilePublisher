import 'package:andipublisher/app/controllers/utils_controller.dart';
import 'package:get/get.dart';

class EbookTransactionController extends GetxController {
    final UtilsController utilsController = Get.put(UtilsController());

  //TODO: Implement EbookTransactionController

  final count = 0.obs;
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

  void increment() => count.value++;
}
