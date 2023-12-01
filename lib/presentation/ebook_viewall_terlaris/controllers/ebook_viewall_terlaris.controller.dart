import 'package:andipublisher/app/data/models/label_ebook_master_model.dart';
import 'package:andipublisher/app/data/services/ebook_services.dart';
import 'package:get/get.dart';

class EbookViewallTerlarisController extends GetxController {
  //TODO: Implement EbookViewallTerlarisController
  Rxn<LabelEbookMasterModel> ebookNewLabelItemsMasterModel =
      Rxn<LabelEbookMasterModel>();
  Rxn<LabelEbookMasterModel> ebookLarisLabelItemsMasterModel =
      Rxn<LabelEbookMasterModel>();
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
    Map<String, dynamic> body = {"tag": "terbaru", "sortBy": "terbaru"};

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
}
