import 'package:andipublisher/app/data/models/rakbuku_model.dart';
import 'package:andipublisher/app/data/services/rakbuku_service.dart';
import 'package:get/get.dart';

class RakBukuController extends GetxController {
  final RakBukuService _rakBukuService = RakBukuService();

  final rakBukuBeli = <RakBukuModel>[].obs;
  final rakBukuSewa = <RakBukuModel>[].obs;
  final isLoading = true.obs;
  final selectedCardIndex = ''.obs; // Tambahkan variabel selectedCardIndex

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
    isLoading.value = false;
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getRakbuku(String idUser, int tag) async {
    try {
      isLoading.value = true;
      final _rakBukuService = await RakBukuService.getRakbuku(idUser, tag);
      if (tag == 1) {
        rakBukuBeli.assignAll(_rakBukuService as Iterable<RakBukuModel>);
      } else if (tag == 2) {
        rakBukuSewa.assignAll(_rakBukuService as Iterable<RakBukuModel>);
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      print('Error fetching rak buku: $e');
    }
  }

  // Fungsi untuk mengatur selectedCardIndex
  void setSelectedCardIndex(String cardId) {
    selectedCardIndex.value = cardId;
  }
}
