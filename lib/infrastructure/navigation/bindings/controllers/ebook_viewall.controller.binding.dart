import 'package:get/get.dart';

import '../../../../presentation/ebook_viewall/controllers/ebook_viewall.controller.dart';

class EbookViewallControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EbookViewallController>(
      () => EbookViewallController(),
    );
  }
}
