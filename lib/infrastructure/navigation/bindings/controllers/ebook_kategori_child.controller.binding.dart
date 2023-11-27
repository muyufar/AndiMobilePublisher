import 'package:get/get.dart';

import '../../../../presentation/ebook_kategori_child/controllers/ebook_kategori_child.controller.dart';

class EbookKategoriChildControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EbookKategoriChildController>(
      () => EbookKategoriChildController(),
    );
  }
}
