import 'package:andipublisher/app/data/models/label_ebook_master_model.dart';
import 'package:andipublisher/app/data/services/ebook_services.dart';
import 'package:get/get.dart';

class EbookKategoriListController extends GetxController {
  //TODO: Implement EbookKategoriListController

  Rxn<LabelEbookMasterModel> ebooklistkategori =
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
 }
   Future<LabelEbookMasterModel> ebookNewLabelItemsMaster() async {
    Map<String, dynamic> body = {"tag": "terbaru", "sortBy": "terbaru"};

    ebooklistkategori.value =
        await EbookService.getEbookItemsMaster(
      link: 'list',
      body: body,
    );
    return ebooklistkategori.value!;
  }

  
}
