import 'package:get/get.dart';

import '../../../../presentation/ebook_kategori_list/controllers/ebook_kategori_list.controller.dart';

class EbookKategoriListControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EbookKategoriListController>(
      () => EbookKategoriListController(),
    );
  }
}
