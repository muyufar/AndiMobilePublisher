import 'package:andipublisher/app/data/models/banner_model.dart';
import 'package:andipublisher/app/data/models/label_items_master_model.dart';
import 'package:andipublisher/app/data/services/banner_service.dart';
import 'package:andipublisher/app/data/services/items_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final ScrollController scrollController = ScrollController();

  RxList<BannerModel> bannerModel = RxList<BannerModel>();
  Rxn<LabelItemsMasterModel> newLabelItemsMasterModel =
      Rxn<LabelItemsMasterModel>();
  Rxn<LabelItemsMasterModel> bestSallerLabelItemsMasterModel =
      Rxn<LabelItemsMasterModel>();
  Rxn<LabelItemsMasterModel> sewaSallerLabelItemsMasterModel =
      Rxn<LabelItemsMasterModel>();
  Rxn<LabelItemsMasterModel> beliSallerLabelItemsMasterModel =
      Rxn<LabelItemsMasterModel>();

  RxInt currentBanner = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> onRefresh() async {
    await fetchBanner();
    await newLabelItemsMaster();
    await bestSallerLabelItemsMaster();
    await sewaSallerLabelItemsMaster();
    await beliSallerLabelItemsMaster();
  }

  Future<List<BannerModel>> fetchBanner() async {
    bannerModel.value = await BannerService.getBanner();
    return bannerModel;
  }

  Future<LabelItemsMasterModel> newLabelItemsMaster() async {
    newLabelItemsMasterModel.value =
        await ItemsService.getItemsMaster(link: 'new');
    return newLabelItemsMasterModel.value!;
  }

  Future<LabelItemsMasterModel> bestSallerLabelItemsMaster() async {
    bestSallerLabelItemsMasterModel.value =
        await ItemsService.getItemsMaster(link: 'bestSaller');
    return bestSallerLabelItemsMasterModel.value!;
  }

  Future<LabelItemsMasterModel> sewaSallerLabelItemsMaster() async {
    sewaSallerLabelItemsMasterModel.value =
        await ItemsService.getItemsMaster(link: 'sewa');
    return sewaSallerLabelItemsMasterModel.value!;
  }

  Future<LabelItemsMasterModel> beliSallerLabelItemsMaster() async {
    beliSallerLabelItemsMasterModel.value =
        await ItemsService.getItemsMaster(link: 'beli');
    return beliSallerLabelItemsMasterModel.value!;
  }
}
