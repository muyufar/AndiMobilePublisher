import 'package:andipublisher/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:andipublisher/app/data/models/rakbuku_model.dart';
import 'package:andipublisher/presentation/rakbuku/controllers/rakbuku.controller.dart';
import 'package:andipublisher/app/controllers/utils_controller.dart';
import 'package:andipublisher/app/views/views/rakbuku_view.dart';
import 'package:lottie/lottie.dart';

class RakBukuBeliScreen extends StatelessWidget {
  final RakBukuController rakBukuController = Get.put(RakBukuController());
  final UtilsController utilsController = Get.put(UtilsController());

  RakBukuBeliScreen() {
    rakBukuController.getRakbuku(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          if (rakBukuController.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return _buildRakBukuList(rakBukuController.rakBukuBeli);
          }
        },
      ),
    );
  }

  Widget _buildRakBukuList(List<RakBukuModel> rakBukuList) {
    if (rakBukuList.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(Assets.lottie.emptyStatePage, width: 200, height: 200),
            Text('Belum ada Ebook di Rak Buku'),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 131,
          childAspectRatio: 1 / 1,
          mainAxisExtent: Get.height / 3.5,
          mainAxisSpacing: 0,
        ),
        itemCount: rakBukuList.length,
        itemBuilder: (context, index) {
          final rakBuku = rakBukuList[index];
          return RakBukuView(rakBuku);
        },
      ),
    );
  }
}
