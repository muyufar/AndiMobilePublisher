import 'package:get/get.dart';

import '../../../../presentation/item_detail/controllers/item_detail.controller.dart';

class ItemDetailControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ItemDetailController>(
      () => ItemDetailController(),
    );
  }
}
