import 'package:andipublisher/app/data/models/ebook_penerbit_model.dart';
import 'package:andipublisher/app/data/services/ebook_penerbit_service.dart';
import 'package:get/get.dart';

class EbookPenerbitController extends GetxController {
  final isLoading = true.obs;
  final penerbitList = <EbookPenerbitModel>[].obs;
  final currentPage = 1.obs;
  bool hasMore = true;

  @override
  void onInit() {
    super.onInit();
    _fetchPenerbitList();
  }

  Future<void> _fetchPenerbitList() async {
    if (!hasMore) return;

    try {
      isLoading.value = true;
      final List<EbookPenerbitModel> result = await EbookPenerbitService.getListPenerbit(
        limit: 100,
        offset: (currentPage.value - 1) * 100,
      );

      if (result.isNotEmpty) {
        penerbitList.addAll(result);
        currentPage.value++;
      } else {
        hasMore = false;
      }
    } finally {
      isLoading.value = false;
    }
  }
}
