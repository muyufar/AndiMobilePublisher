import 'package:andipublisher/app/data/models/ebook_category_model.dart';
import 'package:andipublisher/app/data/models/label_ebook_master_model.dart';
import 'package:andipublisher/app/data/services/ebook_services.dart';
import 'package:andipublisher/presentation/ebook_kategori_child/controllers/ebook_kategori_child.controller.dart';
import 'package:get/get.dart';

class EbookKategoriListController extends GetxController {
  /// Observable for the list of ebook items
  Rxn<LabelEbookMasterModel> ebooklistkategori = Rxn<LabelEbookMasterModel>();

  /// Observable for the loading state
  final isLoading = true.obs;
  var idKategori = ''.obs;

  /// Reference to the EbookKategoriChildScreenController to access the selected child category ID
  final EbookKategoriChildScreenController childController = Get.find();

  /// Initialize the controller
  @override
  void onInit() {
    super.onInit();

    // Listen for changes in selected child category ID and reload ebook data accordingly
    childController.selectedChildCategoryId
        .listen((String selectedChildCategoryId) {
      loadEbookData(idKategori.value);
    });
  }

  /// Load ebook data initially when the controller is ready
  @override
  void onReady() {
    super.onReady();
    loadEbookData(idKategori.value);
  }

  /// Function to refresh the ebook data
  Future<void> onRefresh() async {
    await loadEbookData(idKategori.value);
  }

  /// Function to fetch ebook data based on the selected child category ID
  Future<LabelEbookMasterModel> loadEbookData(String idKategori) async {
    // Prepare the API request body with the selected child category ID
    this.idKategori.value = idKategori;

    Map<String, dynamic> body = {
      "tag": "kategori",
      "sortBy": "terbaru",
      "idTag": idKategori,
    };

    // Fetch ebook data from the API
    ebooklistkategori.value = await EbookService.getEbookItemsMaster(
      link: 'list',
      body: body,
    );

    // Update the loading state
    isLoading.value = false;

    // Return the fetched ebook data
    return ebooklistkategori.value!;
  }
}