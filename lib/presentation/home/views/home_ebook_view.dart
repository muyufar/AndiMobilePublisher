import 'package:andipublisher/app/data/models/label_ebook_master_model.dart';
import 'package:andipublisher/app/views/views/card_ebook_view.dart';
import 'package:andipublisher/presentation/home/controllers/home.controller.dart';
import 'package:flutter/material.dart';
import 'package:andipublisher/app/views/views/future_view.dart';
import 'package:get/get.dart';

class HomeEbookView extends GetView {
  HomeEbookView({Key? key}) : super(key: key);

  @override
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _labelEbookMaster(
            future: controller.ebookNewLabelItemsMaster(),
            data: controller.ebookNewLabelItemsMasterModel),
      ],
    );
  }
}

FutureView _labelEbookMaster(
    {required Future<Object> future,
    required Rxn<LabelEbookMasterModel> data}) {
  return FutureView(
    future: future,
    widgetEmpty: const SizedBox(),
    widgetBuilder: Obx(
      () => Column(
        children: [
          if (data.value != null) // Tambahkan pengecekan ini
            Row(
              children: [
                const SizedBox(width: 10),
                Text(
                  data.value!.label,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                TextButton(onPressed: () {}, child: const Text('Lainnya')),
                const SizedBox(width: 10),
              ],
            ),
          SizedBox(
            height: 340,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: data.value?.value.length ?? 0, // Perubahan ini
              itemBuilder: (context, index) {
                return CardEbookView(data.value!.value[index]);
              },
            ),
          ),
        ],
      ),
    ),
  );
}
