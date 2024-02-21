import 'package:andipublisher/presentation/ebook_kategori/controllers/ebook_kategori.controller.dart';
import 'package:andipublisher/presentation/ebook_kategori_child/ebook_kategori_child.screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shimmer/shimmer.dart';
import 'package:html_unescape/html_unescape.dart';

class EbookKategoriScreen extends GetView<EbookKategoriScreenController> {
  const EbookKategoriScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(EbookKategoriScreenController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ebook Kategori'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: ShimmerLoaderExample());
        } else if (controller.categories.isEmpty) {
          return const Center(
            child: Text('Tidak ada Kategori'),
          );
        } else {
          return ListView.builder(
            itemCount: controller.categories.length,
            itemBuilder: (context, index) {
              final category = controller.categories[index];
              return GestureDetector(
                onTap: () {
                  Get.to(EbookKategoriChildScreen(), arguments: category);
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
                            imageBuilder: (context, ImageProvider) {
                              return Container(
                                height: 50,
                                width: 50,
                                margin: const EdgeInsets.only(right: 20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 4,
                                      offset: Offset(2, 4),
                                    ),
                                  ],
                                  image: DecorationImage(
                                      image: ImageProvider, fit: BoxFit.cover),
                                ),
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
                                      offset: const Offset(2, 4),
                                    ),
                                  ],
                                ),
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
                                  ],
                                ),
                              );
                            },
                          ),
                          Text(
                            HtmlUnescape().convert(category.namaKategori),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13),
                          ),
                          const Spacer(),
                          const Icon(
                            Ionicons.chevron_forward_sharp,
                            color: Colors.grey,
                          )
                        ],
                      ),
                      const SizedBox(height: 0),
                      const Divider(thickness: 0),
                    ],
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}

class ShimmerLoaderExample extends StatelessWidget {
  const ShimmerLoaderExample({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> objects = [];
    for (int i = 0; i < 8; i++) {
      objects.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60,
                width: double.infinity,
                child: Row(
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.white,
                      child: Container(
                        height: 60,
                        width: 70,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(width: 10), // Jarak antara lingkaran dan kotak
                    Expanded(
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.white,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 1,
              ),
            ],
          ),
        ),
      );
    }
    return Scaffold(
      body: ListView(
        children: objects,
      ),
    );
  }
}
