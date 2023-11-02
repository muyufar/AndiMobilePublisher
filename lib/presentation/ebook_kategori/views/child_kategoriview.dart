import 'package:andipublisher/presentation/ebook_kategori/controllers/ebook_kategori.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChildEbookKategoriScreen extends StatelessWidget {
  final String childCategoryId;
  final refreshKey = GlobalKey<RefreshIndicatorState>();

  ChildEbookKategoriScreen({required this.childCategoryId});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<EbookKategoriController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          controller.categories
              .firstWhere((cat) => cat.idKategori == childCategoryId)
              .namaKategori,
        ),
      ),
      body: FutureBuilder(
        future: controller.loadChildCategories(childCategoryId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Terjadi kesalahan: ${snapshot.error}'));
          } else {
            if (controller.childCategories.isEmpty) {
              return Center(child: Text('Tidak ada kategori anak.'));
            } else {
              return RefreshIndicator(
                key: refreshKey,
                onRefresh: controller.onRefresh,
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
          }
        },
      ),
    );
  }
}
