import 'package:andipublisher/app/controllers/utils_controller.dart';
import 'package:andipublisher/app/data/models/checkout_ebook_model.dart';
import 'package:andipublisher/app/data/models/data_checkout_model.dart';
import 'package:andipublisher/app/data/models/data_ebook_checkout_model.dart';
import 'package:andipublisher/app/data/models/ebook_master_detail_model.dart';
import 'package:andipublisher/app/data/models/ebook_rating_model.dart';
import 'package:andipublisher/app/data/services/ebook_cart_service.dart';
import 'package:andipublisher/app/data/services/ebook_rating_service.dart';
import 'package:andipublisher/app/data/services/ebook_services.dart';
import 'package:andipublisher/app/data/services/ebook_wislist.dart';
import 'package:andipublisher/app/data/services/transaction_ebook_service.dart';
import 'package:andipublisher/app/data/services/voucher_service.dart';
import 'package:andipublisher/app/views/views/dialog_view.dart';
import 'package:andipublisher/infrastructure/navigation/routes.dart';
import 'package:andipublisher/presentation/ebook_detail/views/ebook_detail_bottom_sheet_order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EbookDetailController extends GetxController {
  final UtilsController utilsController = Get.put(UtilsController());

  Rxn<EbookMasterDetailModel> ebookMasterDetailModel =
      Rxn<EbookMasterDetailModel>();

  RxInt priceTotalOrder = 0.obs;
  late bool bottomSheetOrderIsBuy;
  var voucherCode = "".obs;
  var isBuy = false.obs;
  // RxBool isBuy = RxBool(false);

  RxBool isInWishlist = false.obs;
  Rxn<EbookRatingModel> ebookRatings = Rxn<EbookRatingModel>();

  @override
  void onInit() {
    super.onInit();
    checkWishlistStatus();
    ever(ebookMasterDetailModel, (_) {
      checkWishlistStatus();
      ambilDataReview();
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    priceTotalOrder.value = 0;

    super.onClose();
  }

  Future<EbookRatingModel> ambilDataReview() async {
    ebookRatings.value =
        await EbookratingService.getRatingEbook(idEbook: Get.arguments);
    return ebookRatings.value!;
  }

  Future<EbookMasterDetailModel> fetchDetailItem() async {
    ebookMasterDetailModel.value =
        await EbookService.getEbookItemMasterDetail(id: Get.arguments);
    countPriceTotalOrder();
    return ebookMasterDetailModel.value!;
  }

  Future<void> onTapBuyNow() async {
    Get.back();
    isBuy.value = true;
    CheckoutEbookModel checkoutEbookModel =
        await TransactionEbookService.postCheckout(
      tag: 'direck',
      ids: [ebookMasterDetailModel.value!.idBarang],
      voucherCode: voucherCode.value,
      isBuy: [true],
    );

    Get.toNamed(Routes.CHECKOUT_EBOOK, arguments: checkoutEbookModel);
  }

  Future<void> onTapSewaNow() async {
    Get.back();
    isBuy.value = false;
    CheckoutEbookModel checkoutEbookModel =
        await TransactionEbookService.postCheckout(
            tag: 'direck',
            ids: [ebookMasterDetailModel.value!.idBarang],
            voucherCode: voucherCode.value,
            isBuy: [false]);

    Get.toNamed(Routes.CHECKOUT_EBOOK, arguments: checkoutEbookModel);
  }

  Future<void> onTapAddCart() async {
    bool status = await EbookCartService.postAddCart(
      idBarang: ebookMasterDetailModel.value!.idBarang,
    );

    if (status) {
      utilsController.getCountCart();

      //Menutup bottomSheetOrder
      Get.back();
    }
  }

  void onTapBottomSheetOrder({required bool isBuy}) {
    //check user is Login
    if (!utilsController.isLogin.value) {
      Get.dialog(dialogView(
        title: 'Login',
        content: 'Silakan Login terlebih dahulu ! ',
        onTapOke: () {
          Get.back();
          Get.toNamed(Routes.LOGIN);
        },
      ));
      return;
    }

    bottomSheetOrderIsBuy = isBuy;
    Get.bottomSheet(EbookDetailBottomSheetOrderView());
  }

  void countPriceTotalOrder() {
    priceTotalOrder.value = (ebookMasterDetailModel.value!.harga!.total);
  }

  Future<void> addToWishlist() async {
    final idUser = utilsController.userModel.idUser;
    final idEbook = ebookMasterDetailModel.value!.idBarang;

    // Check if the item is already in the wishlist
    if (isInWishlist.value) {
      final response = await EbookWishlistService.removeWishlist(
        idUser: idUser,
        idEbook: idEbook,
      );

      handleWishlistResponse(response,
          successMessage: 'Berhasil dihapus dari wishlist');
    } else {
      final response = await EbookWishlistService.addWishlist(
        idUser: idUser,
        idEbook: idEbook,
      );

      handleWishlistResponse(response,
          successMessage: 'Berhasil ditambahkan ke wishlist');
    }
  }

  Future<void> removeFromWishlist() async {
    final idUser = utilsController.userModel.idUser;
    final idEbook = ebookMasterDetailModel.value!.idBarang;

    // Check if the item is already in the wishlist
    if (isInWishlist.value) {
      final response = await EbookWishlistService.removeWishlist(
        idUser: idUser,
        idEbook: idEbook,
      );

      handleWishlistResponse(response,
          successMessage: 'Berhasil dihapus dari wishlist');
    } else {
      final response = await EbookWishlistService.addWishlist(
        idUser: idUser,
        idEbook: idEbook,
      );

      handleWishlistResponse(response,
          successMessage: 'Berhasil ditambahkan ke wishlist');
    }
  }

  Future<void> checkWishlistStatus() async {
    final idUser = utilsController.userModel.idUser;
    final idEbook = ebookMasterDetailModel.value?.idBarang;

    if (idEbook == null) {
      return;
    }

    final isInWishlistResponse = await EbookWishlistService.isInWishlist(
      idUser: idUser,
      idEbook: idEbook,
    );

    if (isInWishlistResponse is bool) {
      isInWishlist.value = isInWishlistResponse;
    }
  }

  void handleWishlistResponse(dynamic response,
      {required String successMessage}) {
    if (response is bool) {
      if (response) {
        // Wishlist status was changed successfully
        isInWishlist.value = !isInWishlist.value; // Toggle wishlist status
      } else {
        // Handle the case where the API request failed
        Get.snackbar('Error', 'Terjadi kesalahan');
      }
    } else {
      // Handle the case where the API response doesn't have the expected structure
      Get.snackbar('Error', 'Terjadi kesalahan pada respons API');
    }
  }
}
