import 'package:andipublisher/app/controllers/utils_controller.dart';
import 'package:andipublisher/app/data/models/rakbuku_model.dart';
import 'package:andipublisher/app/data/services/rakbuku_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RakBukuController extends GetxController {
  final RakBukuService _rakBukuService = RakBukuService();
  final UtilsController utilsController = Get.put(UtilsController());
  final rakBukuBeli = <RakBukuModel>[].obs;
  final rakBukuSewa = <RakBukuModel>[].obs;
  final isLoading = true.obs;
  final selectedCardIndex = ''.obs;
  String idUser = '';
  final TextEditingController searchController = TextEditingController();

  // Daftar rak buku asli
  List<RakBukuModel> originalRakBukuBeli = [];
  List<RakBukuModel> originalRakBukuSewa = [];

  @override
  void onInit() {
    super.onInit();
    idUser = utilsController.userModel.idUser;
  }

  @override
  void onReady() async {
    super.onReady();
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
        originalRakBukuBeli = rakBukuServiceResult.toList(); // Simpan daftar asli
      } else if (tag == 2) {
        rakBukuSewa.assignAll(rakBukuServiceResult as Iterable<RakBukuModel>);
        originalRakBukuSewa = rakBukuServiceResult.toList(); // Simpan daftar asli
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
    }
  }

  void setSelectedCardIndex(String cardId) {
    selectedCardIndex.value = cardId;
  }

  void searchRakBuku(String query) {
    final filteredBeli = originalRakBukuBeli.where((buku) {
      final judul = buku.judul.toLowerCase();
      return judul.contains(query.toLowerCase());
    }).toList();

    final filteredSewa = originalRakBukuSewa.where((buku) {
      final judul = buku.judul.toLowerCase();
      return judul.contains(query.toLowerCase());
    }).toList();

    rakBukuBeli.assignAll(filteredBeli);
    rakBukuSewa.assignAll(filteredSewa);
  }

  void clearSearchResults() {
    searchController.clear();
    rakBukuBeli.assignAll(originalRakBukuBeli);
    rakBukuSewa.assignAll(originalRakBukuSewa);
  }
}
