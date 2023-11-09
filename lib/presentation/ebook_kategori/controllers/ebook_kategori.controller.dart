import 'package:andipublisher/app/data/models/ebook_category_model.dart';
import 'package:andipublisher/app/data/services/ebook_category_service.dart';
import 'package:andipublisher/presentation/ebook_kategori/views/child_kategoriview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class EbookKategoriController extends GetxController {
  final isLoading = true.obs;
  final categories = <EbookCategoryModel>[].obs;
  final currentPage = 1.obs;
  bool hasMore = true;

  final childCategories = <EbookCategoryModel>[].obs;
  final currentCategoryId = ''.obs;
  final refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    if (!hasMore) return;

    try {
      isLoading.value = true;

      if (currentCategoryId.isEmpty) {
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
        final List<EbookCategoryModel> result = await EbookCategoryService.getListChildCategories(
          limit: 100,
          offset: (currentPage.value - 1) * 100,
          idParent: currentCategoryId.value,
        );

        if (result.isNotEmpty) {
          childCategories.assignAll(result);
        }
      }
    } catch (e) {
      // Tambahkan penanganan kesalahan di sini jika diperlukan
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
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

  Future<void >  onRefresh() async {
    try {
      currentPage.value = 1;
      hasMore = true;
      categories.clear();
      childCategories.clear();
      currentCategoryId.value = '';

      await fetchCategories();
    } catch (e) {
      print('Error: $e');
    } finally {
      refreshKey.currentState?.show(atTop: false);
    }
  }

  void clearChildCategories() {
    childCategories.clear();
    currentCategoryId.value = '';
  }
}

  