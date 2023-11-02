import 'package:andipublisher/app/data/models/ebook_category_model.dart';
import 'package:andipublisher/infrastructure/theme/theme_utils.dart';
import 'package:andipublisher/presentation/ebook_kategori/views/child_kategoriview.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'controllers/ebook_kategori.controller.dart';

class EbookKategoriScreen extends GetView<EbookKategoriController> {
  EbookKategoriScreen({Key? key}) : super(key: key);
  final refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    Get.put(EbookKategoriController());

    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          return Text( controller.currentCategoryId.isEmpty
              ? 'Kategori '
              : 'Kategori ${controller.categories.firstWhere((cat) => cat.idKategori == controller.currentCategoryId.value).namaKategori}',
               style: TextStyle(color: Colors.black), );
              
        }
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.categories.isEmpty) {
          return const Center(
            child: Text('Tidak ada kategori.'),
          );
        } else {
          return RefreshIndicator(
            key: refreshKey,
            onRefresh: controller.onRefresh,
            child: ListView.builder(
              itemCount: controller.currentCategoryId.isEmpty
                  ? controller.categories.length
                  : controller.childCategories.length,
              itemBuilder: (context, index) {
                final category = controller.currentCategoryId.isEmpty
                    ? controller.categories[index]
                    : controller.childCategories[index];

                return GestureDetector(
                  onTap: () {
                    if (category.isHasChild == 1) {
                      Get.to(() => ChildEbookKategoriScreen(
                          childCategoryId: category.idKategori));
                    } else {}
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    color: Colors.white,
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            CachedNetworkImage(
                              imageUrl: category.icon,
                              // width: 70,
                              // height: 70,
                              imageBuilder: (context, imageProvider) {
                                return Container(
                                  height: 50,
                                  width: 50,
                                  margin: const EdgeInsets.only(right: 20),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      // borderRadius: BorderRadius.only(
                                      //     topLeft: Radius.circular(10.0),
                                      //     bottomLeft: Radius.circular(10.0)),
                                      shape: BoxShape.circle,
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 4,
                                            offset: Offset(2, 4)),
                                      ],
                                      image: DecorationImage(
                                          image: imageProvider)),
                                );
                              },
                              placeholder: (context, url) {
                                return Container(
                                  height: 30,
                                  width: 30,
                                  margin: const EdgeInsets.only(right: 12),
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.shade400,
                                            blurRadius: 4,
                                            offset: const Offset(2, 4))
                                      ]),
                                );
                              },
                              errorWidget: (context, url, error) {
                                return Container(
                                  height: 30,
                                  width: 30,
                                  margin: const EdgeInsets.only(right: 12),
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.shade400,
                                            blurRadius: 4,
                                            offset: const Offset(2, 4))
                                      ]),
                                );
                              },
                            ),
                            Text(
                              category.namaKategori,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            const Spacer(),
                            const Icon(
                              Ionicons.chevron_forward_sharp,
                              color: Colors.grey,
                            )
                          ],
                        ),
                        const SizedBox(height: 0),
                        const Divider(thickness: 0)
                      ],
                    ),
                  ),
                );
                // return ListTile(
                //   leading: Container(
                //     width: 50,
                //     height: 50,
                //     margin: const EdgeInsets.only(right: 5),
                //     decoration: BoxDecoration(
                //       color: Colors.white, // Set the background color to white
                //       shape: BoxShape.circle,
                //       boxShadow: const [
                //         BoxShadow(
                //           color: Colors.grey,
                //           blurRadius: 2,
                //           offset: Offset(2, 4),
                //         ),
                //       ],
                //     ),
                //     child: CircleAvatar(
                //       backgroundImage: NetworkImage(category.icon),
                //       // radius: 1,
                //       backgroundColor: Colors.white, // Adjust the radius as needed
                //     ),
                //   ),
                //   title: Text(
                //     category.namaKategori,
                //     style: TextStyle(
                //       fontSize: 17,
                //     ),
                //   ),
                //   onTap: () {
                //     if (category.isHasChild == 1) {
                //       Get.to(() => ChildEbookKategoriScreen(
                //           childCategoryId: category.idKategori));
                //     } else {
                //       // Implement the navigation to the list of ebooks with the selected category here
                //       // Implement as needed
                //     }
                //   },
                // );
              },
            ),
          );
        }
      }),
    );
  }
}
