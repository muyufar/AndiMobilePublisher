import 'package:get/get.dart';

import '../../../../presentation/wishlist/controllers/wishlist.controller.dart';

class WishlistControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WishlistController>(
      () => WishlistController(),
    );
  }
}
