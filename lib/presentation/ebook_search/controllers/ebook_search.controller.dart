import 'package:andipublisher/app/data/models/ebook_master_model.dart';
import 'package:andipublisher/app/data/models/ebook_search_model.dart';
import 'package:andipublisher/app/data/services/ebook_search_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class EbookSearchController extends GetxController {
  final ScrollController scrollController = ScrollController();
  TextEditingController searchTextEditingController = TextEditingController();
  RxList<EbookSearchModel> ebookMasterModel = RxList<EbookSearchModel>();
  late RxList history = [].obs;
  RxBool isLoaded = false.obs;
  int offset = 10;

  @override
  void onInit() {
    readHistory();
    super.onInit();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  Future<void> onScroll() async {
    double maxScroll = scrollController.position.maxScrollExtent;
    double currentScroll = scrollController.position.pixels;
    if (currentScroll == maxScroll) {
      await EbookSearchService.getEbookSearch(
              q: searchTextEditingController.text, offset: offset.toString())
          .then((value) => ebookMasterModel.addAll(value));
      offset += 10;
    }
  }

  void onTapListHistory({required String value}) {
    searchTextEditingController.text = value;
    onTapSearch();
  }

  void onTapSearch() async {
    isLoaded.value = true;
    ebookMasterModel.clear();
    ebookMasterModel.value = await EbookSearchService.getEbookSearch(
        q: searchTextEditingController.text);
    isLoaded.value = false;
    saveHistory();
  }

  void saveHistory() {
    for (int i = 0; i < history.length; i++) {
      if (searchTextEditingController.text.toLowerCase() ==
          history[i].toString().toLowerCase()) {
        return;
      }
    }

    if (history.length > 5) {
      history.removeAt(0);
    }

    history.add(searchTextEditingController.text);
    List historySave = history;
    GetStorage().write('historySearch', historySave);
  }

  void readHistory() {
    history.value = GetStorage().read('historySearch') ?? [];
  }

  void onTapHapusHistory() {
    history.value = [];
    GetStorage().remove('historySearch');
  }
}