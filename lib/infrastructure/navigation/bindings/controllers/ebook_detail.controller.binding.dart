import 'package:get/get.dart';

import '../../../../presentation/ebook_detail/controllers/ebook_detail.controller.dart';

class EbookDetailControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EbookDetailController>(
      () => EbookDetailController(),
    );
  }
}
