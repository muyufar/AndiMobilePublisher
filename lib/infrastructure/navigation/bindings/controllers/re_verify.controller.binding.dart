import 'package:get/get.dart';

import '../../../../presentation/re_verify/controllers/re_verify.controller.dart';

class ReVerifyControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReVerifyController>(
      () => ReVerifyController(),
    );
  }
}
