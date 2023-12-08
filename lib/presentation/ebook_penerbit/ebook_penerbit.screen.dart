import 'package:andipublisher/infrastructure/navigation/routes.dart';
import 'package:andipublisher/presentation/ebook_penerbit/controllers/ebook_penerbit.controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class EbookPenerbitScreen extends GetView<EbookPenerbitController> {
  const EbookPenerbitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(EbookPenerbitController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Penerbit Ebook'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.penerbitList.isEmpty) {
          return const Center(
            child: Text('Tidak ada penerbit.'),
          );
        } else {
          return ListView.builder(
            itemCount: controller.penerbitList.length,
            itemBuilder: (context, index) {
              final penerbit = controller.penerbitList[index];
              return GestureDetector(
                // leading: Image.network(penerbit.icon),
                // title: Text(penerbit.namaPenerbit),
                onTap: () {
                  var id = penerbit.idPenerbit;
                  Map<String, String> penerbitis = {
                    'id': id,
                  };
                  Get.toNamed(Routes.EBOOK_PENERBIT_LIST,
                      arguments: penerbitis);
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
                            imageUrl: penerbit.icon,
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
                            penerbit.namaPenerbit,
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
