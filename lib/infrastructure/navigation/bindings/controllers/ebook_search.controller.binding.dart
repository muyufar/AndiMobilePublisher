import 'package:get/get.dart';

import '../../../../presentation/ebook_search/controllers/ebook_search.controller.dart';

class EbookSearchControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EbookSearchController>(
      () => EbookSearchController(),
    );
  }
}
