import 'package:andipublisher/app/data/models/ebook_category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/ebook_kategori.controller.dart';

class EbookKategoriScreen extends GetView<EbookKategoriController> {
  const EbookKategoriScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(EbookKategoriController());
    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          return Text(controller.currentCategoryId.isEmpty
              ? 'Kategori Ebook'
              : 'Kategori ${controller.categories.firstWhere((cat) => cat.idKategori == controller.currentCategoryId.value).namaKategori}');
        }),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.categories.isEmpty) {
          return const Center(
            child: Text('Tidak ada kategori.'),
          );
        } else {
          return ListView.builder(
            itemCount: controller.currentCategoryId.isEmpty
                ? controller.categories.length
                : controller.childCategories.length,
            itemBuilder: (context, index) {
              final category = controller.currentCategoryId.isEmpty
                  ? controller.categories[index]
                  : controller.childCategories[index];
              if (category.isHasChild == '1') {
                // Gunakan ExpansionPanelList untuk kategori yang memiliki child
                return ExpansionPanelList(

                  elevation: 1,
                  expandedHeaderPadding: EdgeInsets.all(16.0),
                  expansionCallback: (int panelIndex, bool isExpanded) {
                    if (isExpanded) {
                      // Tutup panel saat ditekan kembali
                      controller.clearChildCategories();
                    } else {
                      // Muat child categories saat panel ditekan
                      controller.loadChildCategories(category.idKategori);
                    }
                  },
                  children: [
                    ExpansionPanel(
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return ListTile(
                          leading: Image.network(category.icon),
                          title: Text(category.namaKategori),
                        );
                      },
                      isExpanded: category.isExpanded, // Sesuaikan dengan status kategori yang sedang terbuka
                      body: _buildChildCategories(controller.childCategories),
                    ),
                  ],
                );
              } else {
                return ListTile(
                  leading: Image.network(category.icon),
                  title: Text(category.namaKategori),
                  onTap: () {
                    // Implementasikan navigasi ke daftar ebook dengan kategori yang dipilih
                  },
                );
              }
            },
          );
        }
      }),
    );
  }

  Widget _buildChildCategories(List<EbookCategoryModel> childCategories) {
    return Column(
      children: childCategories.map((category) {
        return ListTile(
          leading: Image.network(category.icon),
          title: Text(category.namaKategori),
          onTap: () {
            // Implementasikan navigasi ke daftar ebook dengan kategori yang dipilih
          },
        );
      }).toList(),
    );
  }
}
