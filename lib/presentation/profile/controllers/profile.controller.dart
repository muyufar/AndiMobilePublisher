import 'package:andipublisher/app/controllers/utils_controller.dart';
import 'package:andipublisher/infrastructure/navigation/routes.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final UtilsController utilsController = Get.put(UtilsController());

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

  void onTapLogout() {
    utilsController.deleteDataUser();
    if (!utilsController.isLogin.value) {
      Get.toNamed(Routes.LOGIN);
    }
  }
}