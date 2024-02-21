import 'package:andipublisher/app/data/models/ebook_category_model.dart';
import 'package:andipublisher/app/data/models/label_ebook_master_model.dart';
import 'package:andipublisher/app/views/views/card_categori_view.dart';
import 'package:andipublisher/app/views/views/card_ebook_view.dart';
import 'package:andipublisher/app/views/views/future_view.dart';
import 'package:andipublisher/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'controllers/ebook_kategori_list.controller.dart';

class EbookKategoriListScreen extends GetView<EbookKategoriListController> {
  const EbookKategoriListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    String idKategori = data['id'];
    return Scaffold(
      appBar: AppBar(
        title: Text('List Ebook'),
      ),
      body: ListView(
        children: [
          _labelEbookMaster(
            future: controller.loadEbookData(idKategori),
            data: controller.ebooklistkategori,
          ),
        ],
      ),
    );
  }

  Widget _buildLottie(Rxn<LabelEbookMasterModel> data) {
    if (data.value?.value?.isEmpty ?? true) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              Assets.lottie.notFound,
              width: 300,
              height: 300,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16), // Spasi antara animasi dan teks
            Text(
              "Tidak ada ebook",
              style: TextStyle(fontSize: 16, ),
            ),
          ],
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  Widget _buildColumn(Rxn<LabelEbookMasterModel> data) {
    if (data.value?.value?.isNotEmpty ?? false) {
      return Column(
        children: [
          const Row(
            children: [
              SizedBox(width: 10),
              Spacer(),
              SizedBox(width: 15),
            ],
          ),
          SingleChildScrollView(
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 131,
                childAspectRatio: 1 / 1,
                mainAxisExtent: Get.height / 2.8,
                mainAxisSpacing: 0,
              ),
              itemCount: data.value?.value?.length ?? 0,
              itemBuilder: (context, index) {
                return CardKategoriView(data.value!.value![index]);
              },
            ),
          ),
        ],
      );
    } else {
      return Container();
    }
  }

  Widget _labelEbookMaster({
    required Future<Object> future,
    required Rxn<LabelEbookMasterModel> data,
  }) {
    return FutureView(
      future: future,
      widgetEmpty: _buildLottie(data),
      widgetBuilder: Obx(
        () => Column(
          children: [
            (data.value?.value?.isNotEmpty ?? false)
                ? _buildColumn(data)
                : _buildLottie(data),
          ],
        ),
      ),
    );
  }
}