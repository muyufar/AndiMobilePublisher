import 'package:get/get.dart';

import '../../../../presentation/rakbuku/controllers/rakbuku.controller.dart';

class RakbukuControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RakbukuController>(
      () => RakbukuController(),
    );
  }
}
