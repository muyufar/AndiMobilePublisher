import 'package:andipublisher/app/data/models/banner_model.dart';
import 'package:andipublisher/app/data/models/ebook_campaign.dart';
import 'package:andipublisher/app/data/models/label_ebook_master_model.dart';
import 'package:andipublisher/app/data/models/label_items_master_model.dart';
import 'package:andipublisher/app/data/services/banner_ebook_service.dart';
import 'package:andipublisher/app/data/services/banner_service.dart';
import 'package:andipublisher/app/data/services/ebook_campaign_service.dart';
import 'package:andipublisher/app/data/services/items_service.dart';
import 'package:andipublisher/app/data/services/ebook_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final ScrollController scrollController = ScrollController();

  RxList<BannerModel> bannerModel = RxList<BannerModel>();
  RxList<BannerModel> bannerModelebook = RxList<BannerModel>();
  RxList<EbookCampaign> campaigns = RxList<EbookCampaign>();

  Rxn<LabelItemsMasterModel> newLabelItemsMasterModel =
      Rxn<LabelItemsMasterModel>();

  Rxn<LabelItemsMasterModel> bestSallerLabelItemsMasterModel =
      Rxn<LabelItemsMasterModel>();

  Rxn<LabelItemsMasterModel> beliSallerLabelItemsMasterModel =
      Rxn<LabelItemsMasterModel>();

  Rxn<LabelEbookMasterModel> ebookNewLabelItemsMasterModel =
      Rxn<LabelEbookMasterModel>();

  Rxn<LabelEbookMasterModel> ebookLarisLabelItemsMasterModel =
      Rxn<LabelEbookMasterModel>();

  Rxn<LabelEbookMasterModel> sewaSallerLabelItemsMasterModel =
      Rxn<LabelEbookMasterModel>();

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
    await fetchBannerEbook();
    await fetchBanner();
    await newLabelItemsMaster();
    await bestSallerLabelItemsMaster();
    await sewaSallerLabelItemsMaster();
    await beliSallerLabelItemsMaster();
    await ebookNewLabelItemsMaster();
    await loadCampaigns();
  }

  Future<List<BannerModel>> fetchBannerEbook() async {
    bannerModelebook.value = await BannerServiceEbook.getBanner();
    return bannerModelebook;
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

  Future<LabelItemsMasterModel> beliSallerLabelItemsMaster() async {
    beliSallerLabelItemsMasterModel.value =
        await ItemsService.getItemsMaster(link: 'beli');
    return beliSallerLabelItemsMasterModel.value!;
  }

  Future<LabelEbookMasterModel> ebookNewLabelItemsMaster() async {
    Map<String, dynamic> body = {"tag": "terbaru"};

    ebookNewLabelItemsMasterModel.value =
        await EbookService.getEbookItemsMaster(
      link: 'list',
      body: body,
    );
    return ebookNewLabelItemsMasterModel.value!;
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

  Future<LabelEbookMasterModel> sewaSallerLabelItemsMaster() async {
    Map<String, dynamic> body = {"tag": "sewa"};

    sewaSallerLabelItemsMasterModel.value =
        await EbookService.getEbookItemsMaster(
      link: 'list',
      body: body,
    );
    return sewaSallerLabelItemsMasterModel.value!;
  }

  Future<void> loadCampaigns() async {
    try {
      final campaignList = await EbbokCampaignService.getCampaigns();
      campaigns.assignAll(campaignList);
    } catch (e) {
      print('Error loading campaigns: $e');
    }
  }


}
