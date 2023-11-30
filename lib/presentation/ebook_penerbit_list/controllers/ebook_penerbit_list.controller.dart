import 'package:andipublisher/app/data/models/label_ebook_master_model.dart';
import 'package:andipublisher/app/data/services/ebook_services.dart';
import 'package:andipublisher/presentation/ebook_penerbit/controllers/ebook_penerbit.controller.dart';
import 'package:get/get.dart';

class EbookPenerbitListController extends GetxController {
  //TODO: Implement EbookPenerbitListController
  Rxn<LabelEbookMasterModel> ebooklistPenerbit = Rxn<LabelEbookMasterModel>();
final isLoading = true.obs;
  var idPenerbit = ''.obs;

  /// Reference to the EbookKategoriChildScreenController to access the selected child category ID
  final EbookPenerbitController childController = Get.find();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

Future<LabelEbookMasterModel> loadEbookData(String idKategori) async {
    // Prepare the API request body with the selected child category ID
    this.idPenerbit.value = idKategori;

    Map<String, dynamic> body = {
      "tag": "penerbit",
      "sortBy": "terbaru",
      "idTag": idKategori,
    };

    // Fetch ebook data from the API
    ebooklistPenerbit.value = await EbookService.getEbookItemsMaster(
      link: 'list',
      body: body,
    );

    // Update the loading state
    isLoading.value = false;

    // Return the fetched ebook data
    return ebooklistPenerbit.value!;
  }

}
