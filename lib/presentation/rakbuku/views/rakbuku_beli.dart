import 'package:andipublisher/app/views/views/rakbuku_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:andipublisher/presentation/rakbuku/controllers/rakbuku.controller.dart';
import 'package:andipublisher/app/data/models/rakbuku_model.dart';

class RakBukuBeliScreen extends StatelessWidget {
  final RakBukuController rakBukuController = Get.put(RakBukuController());

  RakBukuBeliScreen() {
    rakBukuController.getRakbuku('US202006190000000000', 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          if (rakBukuController.isLoading.value) {
            // Tampilkan indikator loading jika data masih dimuat
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return _buildRakBukuList();
          }
        },
      ),
    );
  }

Widget _buildRakBukuList() {
  return GridView.builder(
    shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.all(6),
                        // itemCount: contro,
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 160,
                          childAspectRatio: 2 / 3,
                          mainAxisExtent: Get.height / 3.2,
                          mainAxisSpacing: 18,
                        ),
    itemCount: rakBukuController.rakBukuBeli.length,
    itemBuilder: (context, index) {
      final rakBuku = rakBukuController.rakBukuBeli[index];
      return RakBukuView(rakBuku);
    },
  );
}
}