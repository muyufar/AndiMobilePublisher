import 'package:andipublisher/app/data/models/label_ebook_master_model.dart';
import 'package:andipublisher/app/data/models/label_items_master_model.dart';
import 'package:andipublisher/app/data/services/ebook_services.dart';
import 'package:andipublisher/app/data/services/items_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EbookViewallController extends GetxController {
  late TextEditingController searchTextEditingController;

  //TODO: Implement EbookViewallController
  Rxn<LabelEbookMasterModel> ebookNewLabelItemsMasterModel =
      Rxn<LabelEbookMasterModel>();
  Rxn<LabelEbookMasterModel> ebookLarisLabelItemsMasterModel =
      Rxn<LabelEbookMasterModel>();
  RxList<LabelEbookMasterModel> listEBooks = RxList<LabelEbookMasterModel>();
  final ScrollController scrollController = ScrollController();
  int offset = 0;
  RxBool isLoaded = true.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> onRefresh() async {
    await ebookNewLabelItemsMaster();
    await ebookTerlarisLabelItemsMaster();
  }

  Future<LabelEbookMasterModel> ebookNewLabelItemsMaster() async {
    Map<String, dynamic> body = {"tag": "terbaru", "sortBy": "terbaru", "limit": "100"};

    ebookNewLabelItemsMasterModel.value =
        await EbookService.getEbookItemsMaster(
      link: 'list',
      body: body,
    );
    return ebookNewLabelItemsMasterModel.value!;
  }

  void onScroll() async {
    double maxScroll = scrollController.position.maxScrollExtent;
    double currentScroll = scrollController.position.pixels;

    if (currentScroll == maxScroll) {
      // isLoaded.value = true;
      offset += 20;
      await EbookService.getallList(
              offset: offset.toString(), q: searchTextEditingController.text)
          .then((value) => listEBooks.addAll(value));
    } else {
      // isLoaded.value = false;
    }
  }

  Future<LabelEbookMasterModel> ebookTerlarisLabelItemsMaster() async {
    Map<String, dynamic> body = {"tag": "terlaris", "sortBy": "terlaris"};

    ebookLarisLabelItemsMasterModel.value =
        await EbookService.getEbookItemsMaster(
      link: 'list',
      body: body,
    );
    return ebookLarisLabelItemsMasterModel.value!;
  }
}
