import 'package:andipublisher/app/data/models/ebook_category_model.dart';
import 'package:andipublisher/app/data/services/ebook_category_service.dart';
import 'package:get/get.dart';

class EbookKategoriScreenController extends GetxController {
  final List<EbookCategoryModel> _categories = [];
  final categoriList = <EbookCategoryModel>[].obs;
  final isLoading = true.obs;

  List<EbookCategoryModel> get categories => _categories;
  @override
  void onInit() {
    super.onInit();
    loadCategories();
    // Get.put(EbookKategoriScreenController());
  }

  Future<void> loadCategories() async {
    isLoading.value = true;
    final List<EbookCategoryModel> result =
        await EbookCategoryService.getListCategories(limit: 100, offset: 0);
    _categories.clear();
    _categories.addAll(result);
    update();
    isLoading.value = false;
  }
}
