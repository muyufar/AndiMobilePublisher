import 'package:get/get.dart';

import '../../../../presentation/ebook_penerbit/controllers/ebook_penerbit.controller.dart';

class EbookPenerbitControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EbookPenerbitController>(
      () => EbookPenerbitController(),
    );
  }
}
