import 'package:andipublisher/app/controllers/utils_controller.dart';
import 'package:andipublisher/app/data/models/rakbuku_model.dart';
import 'package:andipublisher/app/data/services/rakbuku_service.dart';
import 'package:get/get.dart';

class RakBukuController extends GetxController {
  final RakBukuService _rakBukuService = RakBukuService();
  final UtilsController utilsController = Get.put(UtilsController());
  final rakBukuBeli = <RakBukuModel>[].obs;
  final rakBukuSewa = <RakBukuModel>[].obs;
  final isLoading = true.obs;
  final selectedCardIndex = ''.obs;
  String idUser = '';

  @override
  void onInit() {
    super.onInit();
     idUser = utilsController.userModel.idUser;
  }

  @override
  void onReady() async {
    super.onReady();
    // idUser = utilsController.userModel.idUser;
    await getRakbuku(1); // Mengambil rak buku dengan tag 1
    isLoading.value = false;
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getRakbuku(int tag) async {
    try {
      isLoading.value = true;
      final rakBukuServiceResult = await RakBukuService.getRakbuku(tag, idUser);
      if (tag == 1) {
        rakBukuBeli.assignAll(rakBukuServiceResult as Iterable<RakBukuModel>);
      } else if (tag == 2) {
        rakBukuSewa.assignAll(rakBukuServiceResult as Iterable<RakBukuModel>);
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      // print('Error fetching rak buku: $e');
    }
  }

  void setSelectedCardIndex(String cardId) {
    selectedCardIndex.value = cardId;
  }
}
