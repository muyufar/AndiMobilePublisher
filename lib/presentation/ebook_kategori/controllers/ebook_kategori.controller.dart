  import 'package:andipublisher/app/data/models/ebook_category_model.dart';
  import 'package:andipublisher/app/data/services/ebook_category_service.dart';
  import 'package:get/get.dart';

  class EbookKategoriController extends GetxController {
    final isLoading = true.obs;
    final categories = <EbookCategoryModel>[].obs;
    final currentPage = 1.obs;
    bool hasMore = true;

    // Properti tambahan untuk child category
    final childCategories = <EbookCategoryModel>[].obs;
    final currentCategoryId = ''.obs; // ID kategori saat ini

    @override
    void onInit() {
      super.onInit();
      _fetchCategories();
    }

    Future<void> _fetchCategories() async {
      if (!hasMore) return;

      try {
        isLoading.value = true;

        if (currentCategoryId.isEmpty) {
          // Jika ID kategori saat ini kosong, ambil kategori utama
          final List<EbookCategoryModel> result = await EbookCategoryService.getListCategories(
            limit: 100,
            offset: (currentPage.value - 1) * 100,
          );

          if (result.isNotEmpty) {
            categories.addAll(result);
            currentPage.value++;
          } else {
            hasMore = false;
          }
        } else {
          // Jika ID kategori saat ini tidak kosong, ambil child category
          final List<EbookCategoryModel> result = await EbookCategoryService.getListChildCategories(
            limit: 100,
            offset: (currentPage.value - 1) * 100,
            idParent: currentCategoryId.value,
          );

          if (result.isNotEmpty) {
            childCategories.assignAll(result);
          }
        }
      } finally {
        isLoading.value = false;
      }
    }

    // Fungsi untuk memuat child categories berdasarkan ID kategori parent
      Future<void> loadChildCategories(String categoryId) async {
    try {
      // Bersihkan daftar child categories saat ini
      childCategories.clear();
      
      // Set isExpanded untuk parent kategori yang sedang terbuka
      for (final category in categories) {
        category.isExpanded = category.idKategori == categoryId;
      }

      currentCategoryId.value = categoryId;

      // Muat child categories berdasarkan ID kategori parent
      final List<EbookCategoryModel> result = await EbookCategoryService.getListChildCategories(
        limit: 100,
        offset: 0,
        idParent: categoryId,
      );

      if (result.isNotEmpty) {
        childCategories.assignAll(result);
      }
    } finally {
      isLoading.value = false;
    }
  }

    void clearChildCategories() {
    childCategories.clear();
    currentCategoryId.value = '';
  }
  }
