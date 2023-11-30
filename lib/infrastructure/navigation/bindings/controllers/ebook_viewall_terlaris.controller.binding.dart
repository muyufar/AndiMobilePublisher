import 'package:get/get.dart';

import '../../../../presentation/ebook_viewall_terlaris/controllers/ebook_viewall_terlaris.controller.dart';

class EbookViewallTerlarisControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EbookViewallTerlarisController>(
      () => EbookViewallTerlarisController(),
    );
  }
}
