import 'package:andipublisher/presentation/ebook_penerbit/controllers/ebook_penerbit.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
              return ListTile(
                leading: Image.network(penerbit.icon),
                title: Text(penerbit.namaPenerbit),
              );
            },
          );
        }
      }),
    );
  }
}
