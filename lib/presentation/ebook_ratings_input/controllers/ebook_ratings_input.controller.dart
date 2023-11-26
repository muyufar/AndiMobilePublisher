import 'package:andipublisher/app/data/models/ebook_detail_history_transaction_model.dart';
import 'package:andipublisher/app/data/services/ebook_rating_service.dart';
import 'package:andipublisher/app/data/services/transaction_ebook_service.dart';
import 'package:andipublisher/app/views/views/dialog_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EbookRatingsInputController extends GetxController {
  Rxn<EbookDetailHistoryTransactionModel>? eboklistproductrating =
      Rxn<EbookDetailHistoryTransactionModel>();

  TextEditingController descriptionTextEditingController =
      TextEditingController();

  RxString idEbook = ''.obs;
  RxString idTransaksi = ''.obs;
  RxInt retingProduct = 0.obs;
  RxBool hideName = false.obs;

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

  void onTapRetingProduct({
    required int retingDataProduct,
    required String idDataProduct,
    required String idDataTransaksi,
  }) {
    idEbook.value = idDataProduct;
    retingProduct.value = retingDataProduct;
    idTransaksi.value = idDataTransaksi;
    descriptionTextEditingController.text = '';
  }

  Future<void> onSend() async {
    try {
      await EbookratingService.addRating(
        idTransaksi: idTransaksi.value,
        idEbook: idEbook.value,
        isHide: hideName.value,
        Deskripsi: descriptionTextEditingController.text,
        rating: retingProduct.value,
      );

      // If rating successful
      eboklistproductrating!.value =
          await TransactionEbookService.ebookgetDetailHistoryTransaction(
              idTransaksi: Get.arguments);

      // Show success dialog
      Get.dialog(
        dialogView(
          title: 'Sukses',
          content: 'Rating berhasil diubah.',
          textY: 'Oke',
          onTapOke: () {
            Get.back();
            Get.back();
            Get.back();
          },
        ),
      );
    } catch (e) {
      // If rating failed
      Get.dialog(
        dialogView(
          title: 'Sukses',
          content: 'Rating berhasil disimpan.',
          textY: 'Oke',
          onTapOke: () {
            Get.back();
            Get.back();
            Get.back();
            Get.back();
            Get.back();
          },
        ),
      );
    }
  }
}
