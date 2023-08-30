import 'package:andipublisher/app/controllers/utils_controller.dart';
import 'package:andipublisher/infrastructure/navigation/routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final UtilsController utilsController = Get.put(UtilsController());

  @override
  void onInit() async {
    await utilsController.checkConnection();
    utilsController.getDataUser();
    super.onInit();
  }

  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 4), () {
      Get.offNamed(Routes.MAIN);
      // if (utilsController.isLogin.value) {
      //   Get.offNamed(Routes.MAIN);
      // } else {
      //   Get.offNamed(Routes.MAIN);
      // }
    });

    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
