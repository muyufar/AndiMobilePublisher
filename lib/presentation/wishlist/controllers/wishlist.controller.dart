import 'package:andipublisher/app/controllers/utils_controller.dart';
import 'package:andipublisher/app/data/models/ebook_whislist_model.dart';
import 'package:andipublisher/app/data/services/ebook_wislist.dart';
import 'package:get/get.dart';

class WishlistController extends GetxController {
  final UtilsController utilsController = Get.put(UtilsController());
  final RxList<EbookWishlistItem> wishlist = <EbookWishlistItem>[].obs;
  final RxBool isLoading = false.obs; // Variabel isLoading untuk melacak status loading

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    getWishlistData(); // Panggil getWishlistData saat controller siap (sudah diinisialisasi)
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // Fungsi untuk menambahkan ebook ke wishlist
  Future<void> addToWishlist(String idEbook) async {
    final idUser = utilsController.userModel.idUser; // Ganti dengan id user yang sesuai
    final result = await EbookWishlistService.addWishlist(
        idUser: idUser, idEbook: idEbook);
    if (result) {
      // Wishlist berhasil ditambahkan, refresh data wishlist
      getWishlistData();
    } else {
      // Wishlist gagal ditambahkan, lakukan penanganan kesalahan
    }
  }

  // Fungsi untuk menghapus ebook dari wishlist
  Future<void> removeFromWishlist(EbookWishlistItem ebookItem) async {
    final idUser = utilsController.userModel.idUser; // Ganti dengan id user yang sesuai
    final result = await EbookWishlistService.removeWishlist(
        idUser: idUser, idEbook: ebookItem.idBarang);
    if (result) {
      // Wishlist item berhasil dihapus, refresh data wishlist
      getWishlistData();
    } else {
      // Gagal menghapus item dari wishlist, lakukan penanganan kesalahan
    }
  }

  // Fungsi untuk memperbarui data wishlist
  Future<void> getWishlistData() async {
    isLoading.value = true; // Set isLoading ke true ketika sedang memuat data
    final idUser = utilsController.userModel.idUser; // Ganti dengan id user yang sesuai
    final wishlistData = await EbookWishlistService.getWishlist(idUser);
    wishlist.assignAll(wishlistData);
    isLoading.value = false; // Set isLoading ke false ketika data telah dimuat
  }
}
