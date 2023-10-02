import 'package:andipublisher/app/controllers/utils_controller.dart';
import 'package:andipublisher/app/data/models/ebook_whislist_model.dart';
import 'package:andipublisher/app/data/services/ebook_wislist.dart';
import 'package:get/get.dart';

class WishlistController extends GetxController {
  final UtilsController utilsController = Get.put(UtilsController());
  final RxList<EbookWishlistItem> wishlist = <EbookWishlistItem>[].obs;

  @override
  void onInit() {
    // Pindahkan pengambilan data wishlist ke getWishlistData agar dapat digunakan ulang
    getWishlistData();
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

  void getWishlistData() async {
    final idUser = utilsController.userModel.idUser; // Ganti dengan id user yang sesuai
    final wishlistData = await EbookWishlistService.getWishlist(idUser);
    wishlist.assignAll(wishlistData);
  }
}
