import 'package:andipublisher/app/data/models/category_model.dart';
import 'package:andipublisher/app/data/models/ebook_category_model.dart';
import 'package:get/get.dart';

import '../../../../presentation/ebook_kategori_child/controllers/ebook_kategori_child.controller.dart';

class EbookKategoriChildControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EbookKategoriChildScreenController>(
      () => EbookKategoriChildScreenController(CategoryModel as EbookCategoryModel),
    );
  }
}
