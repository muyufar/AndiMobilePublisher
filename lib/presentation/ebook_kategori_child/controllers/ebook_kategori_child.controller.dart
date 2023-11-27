import 'package:andipublisher/app/data/models/ebook_category_model.dart';
import 'package:andipublisher/app/data/services/ebook_category_service.dart';
import 'package:get/get.dart';

class EbookKategoriChildController extends GetxController {
  //TODO: Implement EbookKategoriChildController
  final categories = <EbookCategoryModel>[].obs;
  final childCategories = <EbookCategoryModel>[].obs;
  final currentCategoryId = ''.obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
        // Get.put(EbookKategoriChildController());

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  
  Future<void > loadChildCategories(String categoryId) async {
    try {
      for (final category in categories) {
        category.isExpanded = category.idKategori == categoryId;
      }

      childCategories.clear();
      currentCategoryId.value = categoryId;

      final List<EbookCategoryModel> result = await EbookCategoryService.getListChildCategories(
        limit: 100,
        offset: 0,
        idParent: categoryId,
      );

      if (result.isNotEmpty) {
        childCategories.assignAll(result);
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

}
