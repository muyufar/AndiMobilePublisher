import 'package:andipublisher/app/data/models/label_ebook_master_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:staggered_grid_view_flutter/widgets/sliver.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import 'package:andipublisher/app/data/models/ebook_master_model.dart';
import 'package:andipublisher/app/views/views/card_ebook_view.dart';
import 'package:andipublisher/gen/assets.gen.dart';
import 'package:andipublisher/presentation/ebook_viewall/controllers/ebook_viewall.controller.dart';

class EbookViewallScreen  extends GetView<EbookViewallController> {
  final EbookViewallController controller =
      Get.put(EbookViewallController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ebook Terlaris"),
      ),
      body: SingleChildScrollView(
        child: _labelEbookMaster(
          future: controller.ebookNewLabelItemsMaster(),
          data: controller.ebookNewLabelItemsMasterModel,
        ),
        // child:   _labelEbookMaster(
        //   future: controller.ebookTerlarisLabelItemsMaster(),
        //   data: controller.ebookLarisLabelItemsMasterModel,
        // ),
      ),
    );
  }

  Widget _labelEbookMaster({
    required Future<Object> future,
    required Rxn<LabelEbookMasterModel> data,
  }) {
    return FutureBuilder<Object>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (!snapshot.hasData || data.value == null) {
          return SizedBox(); // Tampilkan widget kosong jika data belum tersedia
        } else {
          return Column(
            children: [
              Row(
                children: [
                  const SizedBox(width: 10),
                  SizedBox(width: 15),
                ],
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Mengatur jumlah kolom yang tetap
                  crossAxisSpacing: 0, // Spasi antar kolom
                  mainAxisSpacing: 0, // Spasi antar baris
                  childAspectRatio: 1 / 2.3, // Ratio lebar/tinggi setiap item
                ),
                itemCount: data.value?.value?.length ?? 0,
                itemBuilder: (context, index) {
                  return CardEbookView(data.value!.value![index]);
                },
              ),
            ],
          );
        }
      },
    );
  }
}
