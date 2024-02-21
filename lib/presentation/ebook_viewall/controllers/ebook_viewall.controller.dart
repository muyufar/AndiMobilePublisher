import 'package:andipublisher/app/data/models/label_ebook_master_model.dart';
import 'package:andipublisher/app/data/services/ebook_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EbookViewallController extends GetxController {
  final ScrollController scrollController = ScrollController();
  
  Rxn<LabelEbookMasterModel> ebookNewLabelItemsMasterModel =
      Rxn<LabelEbookMasterModel>();
  Rxn<LabelEbookMasterModel> ebookLarisLabelItemsMasterModel =
      Rxn<LabelEbookMasterModel>();

  int limit = 10;

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels == 0) {
          // You're at the top.
        } else {
          // You're at the bottom.
          increaseLimit();
        }
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
    loadInitialData();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> loadInitialData() async {
    await ebookNewLabelItemsMaster();
    await ebookTerlarisLabelItemsMaster();
  }

  Future<void> loadMoreData() async {
    await ebookTerlarisLabelItemsMaster(limit: limit.toString());
    limit += 10;
  }

  Future<LabelEbookMasterModel> ebookNewLabelItemsMaster() async {
    Map<String, dynamic> body = {
      "tag": "terbaru",
      "sortBy": "terbaru",
      'limit':  '50',
    };

    ebookNewLabelItemsMasterModel.value =
        await EbookService.getEbookItemsMaster(
      link: 'list',
      body: body,
    );
    return ebookNewLabelItemsMasterModel.value!;
  }

  Future<LabelEbookMasterModel> ebookTerlarisLabelItemsMaster(
      {String? limit}) async {
    Map<String, dynamic> body = {
      "tag": "terlaris",
      "sortBy": "terlaris",
      // 'limit': limit ?? '0',
    };

    ebookLarisLabelItemsMasterModel.value =
        await EbookService.getEbookItemsMaster(
      link: 'list',
      body: body,
    );
    return ebookLarisLabelItemsMasterModel.value!;
  }

  void increaseLimit() {
    loadMoreData();
  }
}
