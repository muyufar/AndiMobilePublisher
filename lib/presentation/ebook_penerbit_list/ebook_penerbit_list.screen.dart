import 'package:andipublisher/app/data/models/label_ebook_master_model.dart';
import 'package:andipublisher/app/views/views/card_categori_view.dart';
import 'package:andipublisher/app/views/views/future_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/ebook_penerbit_list.controller.dart';

class EbookPenerbitListScreen extends GetView<EbookPenerbitListController> {
  const EbookPenerbitListScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    String idKategori = data['id'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ebook Penerbit'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          _labelEbookMaster(
            future: controller.loadEbookData(idKategori),
            data: controller.ebooklistPenerbit,
          ),
        ],
      ),
    );
  }

  Widget _labelEbookMaster({
    required Future<Object> future,
    required Rxn<LabelEbookMasterModel> data,
  }) {
    return FutureView(
      future: future,
      widgetEmpty: const SizedBox(),
      widgetBuilder: Obx(
        () => Column(
          children: [
            if (data.value != null)
              Row(
                children: [
                  const SizedBox(width: 10),
                  // Text(
                  //   data.value!.label,
                  //   style: const TextStyle(
                  //     fontSize: 18,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                ],
              ),
            SizedBox(
              height: 290,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: data.value?.value.length ?? 0,
                itemBuilder: (context, index) {
                  return CardKategoriView(data.value!.value[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
