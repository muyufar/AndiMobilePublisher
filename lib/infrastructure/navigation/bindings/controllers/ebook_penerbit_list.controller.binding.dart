import 'package:get/get.dart';

import '../../../../presentation/ebook_penerbit_list/controllers/ebook_penerbit_list.controller.dart';

class EbookPenerbitListControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EbookPenerbitListController>(
      () => EbookPenerbitListController(),
    );
  }
}
