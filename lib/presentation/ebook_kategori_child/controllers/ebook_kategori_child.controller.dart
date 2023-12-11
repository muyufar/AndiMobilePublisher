import 'package:andipublisher/app/data/models/ebook_category_model.dart';
import 'package:andipublisher/app/data/services/ebook_category_service.dart';
import 'package:get/get.dart';

class EbookKategoriChildScreenController extends GetxController {
  final EbookCategoryModel category;

  final RxList<EbookCategoryModel> _childCategories =
      <EbookCategoryModel>[].obs;
  final isLoading = true.obs;
final currentCategoryId = ''.obs;
  final RxString selectedChildCategoryId = RxString('');

  EbookKategoriChildScreenController(this.category) {
    // Set the selected child category ID initially
    selectedChildCategoryId.value = category.idKategori;

    // Listen for changes in child categories and update the selected category accordingly
    ever(RxList(_childCategories), (List<EbookCategoryModel> categories) {
      if (categories != null && categories.isNotEmpty) {
        if (selectedChildCategoryId.value == '') {
          selectedChildCategoryId.value = categories[0].idKategori;
        }
      }
    });

    // Load child categories initially
    loadChildCategories();
  }

  List<EbookCategoryModel> get childCategories => _childCategories;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> loadChildCategories() async {
    isLoading.value = true;
    currentCategoryId.value = category.idKategori;
    final List<EbookCategoryModel> result =
        await EbookCategoryService.getListChildCategories(
      limit: 100,
      offset: 0,
      idParent: category.idKategori,
    );
    _childCategories.clear();
    _childCategories.addAll(result);
    update();
    // if (selectedChildCategoryId.value == '') {
    //   selectedChildCategoryId.value = result[0].idKategori;
    // }
    isLoading.value = false;
  }
}
