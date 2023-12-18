import 'package:andipublisher/app/data/models/ebook_category_model.dart';
import 'package:andipublisher/infrastructure/navigation/routes.dart';
import 'package:andipublisher/presentation/ebook_kategori_list/ebook_kategori_list.screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/ebook_kategori_child.controller.dart';

class EbookKategoriChildScreen
    extends GetView<EbookKategoriChildScreenController> {
  const EbookKategoriChildScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the category from the navigation arguments
    final EbookCategoryModel category = Get.arguments;

    // Initialize the controller using Get.put()
    Get.put(EbookKategoriChildScreenController(category));

    return Scaffold(
      appBar: AppBar(
        title: Text(category.namaKategori),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.childCategories.isEmpty) {
          return const Center(
            child: Text('Tidak ada Kategori'),
          );
        } else {
          return ListView.builder(
            itemCount: controller.childCategories.length,
            itemBuilder: (context, index) {
              final childCategory = controller.childCategories[index];
              return ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(childCategory.namaKategori),
                    Text(childCategory.jumlah.toString()),
                  ],
                ),
                onTap: () {
                  var id = childCategory.idKategori;
                  Map<String, String> kategoris = {
                    'id': id,
                  };
                  Get.toNamed(Routes.EBOOK_KATEGORI_LIST, arguments: kategoris);
                },
              );
            },
          );
        }
      }),
    );
  }
}
