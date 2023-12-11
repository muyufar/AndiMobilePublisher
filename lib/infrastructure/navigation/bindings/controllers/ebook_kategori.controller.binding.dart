import 'package:get/get.dart';

import '../../../../presentation/ebook_kategori/controllers/ebook_kategori.controller.dart';

class EbookKategoriControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EbookKategoriScreenController>(
      () => EbookKategoriScreenController(),
    );
  }
}
