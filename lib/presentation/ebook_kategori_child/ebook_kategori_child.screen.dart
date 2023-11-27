import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/ebook_kategori_child.controller.dart';

class EbookKategoriChildScreen extends StatelessWidget {


   const EbookKategoriChildScreen({Key? key,}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EbookKategoriChildController());
  final GlobalKey<RefreshIndicatorState> refreshKey = GlobalKey<RefreshIndicatorState>();
final String childCategoryId;
    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          final selectedCategory = controller.categories.firstWhere(
            (cat) => cat.idKategori == controller.currentCategoryId.value,
          );
          return Text(selectedCategory.namaKategori);
        }),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.childCategories.isEmpty) {
          return Center(child: Text('Tidak ada kategori anak.'));
        } else {
          return RefreshIndicator(
            key: refreshKey,
            onRefresh: () => controller.loadChildCategories(controller.currentCategoryId.value),
            child: ListView.builder(
              itemCount: controller.childCategories.length,
              itemBuilder: (context, index) {
                final category = controller.childCategories[index];
                return ListTile(
                  title: Text(category.namaKategori),
                  // Implementasikan tindakan saat item dipilih jika diperlukan
                );
              },
            ),
          );
        }
      }),
    );
  }
}
