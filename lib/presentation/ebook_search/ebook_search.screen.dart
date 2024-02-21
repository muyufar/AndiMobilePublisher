import 'package:andipublisher/app/views/views/app_bar_view.dart';
import 'package:andipublisher/app/views/views/card_ebook_view.dart';
import 'package:andipublisher/app/views/views/ebook_card_search_grid_view.dart';
import 'package:andipublisher/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'controllers/ebook_search.controller.dart';

class EbookSearchScreen extends GetView<EbookSearchController> {
  EbookSearchScreen({Key? key}) : super(key: key);

  @override
  final EbookSearchController controller = Get.put(EbookSearchController());
  @override
  Widget build(BuildContext context) {
    controller.scrollController.addListener(controller.onScroll);
    return Scaffold(
        appBar: appBarSearchV2(
            title: 'Pencarian Ebook',
            controller: controller.searchTextEditingController,
            onSubmitted: (value) => controller.onTapSearch()),
        body: ListView(
          controller: controller.scrollController,
          children: [
            Obx(
              () => (controller.isLoaded.value)
                  ? const Center(child: CircularProgressIndicator())
                  : (controller.ebookMasterModel.isNotEmpty)
                      ? GridView.builder(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          padding: const EdgeInsets.only(
                              top: 16, right: 16, left: 16),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 16,
                            childAspectRatio: 2 / 3.2,
                          ),
                          itemCount: controller.ebookMasterModel.length,
                          itemBuilder: (context, index) => Center(
                            child: EbookCardSearchGridView(
                                controller.ebookMasterModel[index]),
                          ),
                        )
                      : (controller.searchTextEditingController.text.isEmpty)
                          ? ListView.builder(
                              shrinkWrap: true,
                              itemCount: controller.history.length,
                              reverse: true,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () => controller.onTapListHistory(
                                      value: controller.history[index]),
                                  child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12),
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      decoration: const BoxDecoration(
                                          border: Border(
                                        bottom: BorderSide(color: Colors.grey),
                                      )),
                                      child: Text(
                                        controller.history[index],
                                        style: const TextStyle(fontSize: 16),
                                      )),
                                );
                              },
                            )
                          : Stack(
                              children: [
                                Center(
                                    child:
                                        Lottie.asset(Assets.lottie.notFound)),
                                Center(
                                    child: Padding(
                                  padding: const EdgeInsets.only(top: 340),
                                  child: Text('Ebook yang anda cari tidak ada'),
                                ))
                              ],
                            ),
            )
          ],
        ),
        floatingActionButton: Obx(
          () => (controller.ebookMasterModel.isEmpty)
              ? GestureDetector(
                  onTap: () => controller.onTapHapusHistory(),
                  child: Container(
                    height: 40,
                    width: Get.width - 28,
                    alignment: Alignment.center,
                    // margin: EdgeInsets.symmetric(horizontal: 16),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        border: Border(top: BorderSide(color: Colors.grey))),
                    child: const Text(
                      'Hapus Riwayat Pencarian',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ))
              : SizedBox(),
        ));
  }
}
