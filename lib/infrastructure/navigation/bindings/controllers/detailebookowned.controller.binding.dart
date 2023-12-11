import 'package:get/get.dart';

import '../../../../presentation/detailebookowned/controllers/detailebookowned.controller.dart';

class DetailebookownedControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailebookownedController>(
      () => DetailebookownedController(),
    );
  }
}
