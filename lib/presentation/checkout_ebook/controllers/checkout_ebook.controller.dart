import 'package:andipublisher/app/data/models/checkout_ebook_model.dart';
import 'package:andipublisher/app/data/models/data_ebook_checkout_model.dart';
import 'package:andipublisher/app/data/models/payment_ebook_model.dart';
import 'package:andipublisher/app/data/services/transaction_ebook_service.dart';
import 'package:andipublisher/app/views/views/dialog_view.dart';
import 'package:andipublisher/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:andipublisher/presentation/payment_ebook/controllers/payment_ebook.controller.dart';

class CheckoutEbookController extends GetxController {
  final TextEditingController textVoucher = TextEditingController();

  CheckoutEbookModel checkoutEbookModel = Get.arguments;
  RxInt hargaTotalProduct = 0.obs;
  RxInt diskonTotalProduct = 0.obs;
  RxList<int> totalDiscount = <int>[].obs;
  RxList<int> priceSubTotalItmes = <int>[].obs;

  var voucher = 0.obs;
  var totalHarga = 0.obs;

  //TODO: Implement CheckoutEbookController

  final count = 0.obs;
  @override
  void onInit() {
    setPriceTotalItmes();
    calculateTotalDiscount();
    super.onInit();
  }

  @override
  void onReady() {
    hargaTotalProduct.value =
        priceSubTotalItmes.reduce((value, element) => value + element);
    diskonTotalProduct.value =
        totalDiscount.reduce((value, element) => value + element);
    super.onReady();
  }

  @override
  void onClose() {
    Get.back();
    super.onClose();
  }

  void setPriceTotalItmes() {
    for (DataEbookCheckout dataEbookCheckout
        in checkoutEbookModel.dataEbookCheckout) {
      for (Item item in dataEbookCheckout.items) {
        priceSubTotalItmes.add(item.harga);
      }
    }
  }

  void calculateTotalBelanja() {
    int harga = checkoutEbookModel.subtotal.total;
    // int diskon = checkoutEbookModel.subtotal.diskon.barang;
    // int penanganan = checkoutEbookModel.subtotal.penanganan;
    int iVoucher = checkoutEbookModel.subtotal.diskon.voucher;

    // Subtract diskonTotalProduct and add biayaPenanganan here if needed
    totalHarga.value = harga;
    // totalHarga.value = diskon;
    // totalHarga.value = voucher;
    // totalHarga.value = penanganan;

    print("RESULT_CAL: $iVoucher");

    voucher.value = iVoucher;
  }

  void calculateTotalDiscount() {
    for (DataEbookCheckout dataEbookCheckout
        in checkoutEbookModel.dataEbookCheckout) {
      for (Item item in dataEbookCheckout.items) {
        totalDiscount.add(item.diskon);
      }
    }
  }

  Future<void> onTapSelectPayment() async {
    // validator

    List<DataEbookCheckoutMolde> dataEbookCheckout = [];
    List<Product> products = [];

    for (var product in checkoutEbookModel.dataEbookCheckout[0].items) {
      Product valueProduct = Product(idProduct: product.idBarang);
      products.add(valueProduct);
    }

    DataEbookCheckoutMolde valueDataEbookCheckoutMolde =
        DataEbookCheckoutMolde(products: products);

    dataEbookCheckout.add(valueDataEbookCheckoutMolde);

    PaymentEbookModel result = await TransactionEbookService.postPayment(
      usePoinUser: false,
      dataEbookCheckout: dataEbookCheckout,
      // isVoucher: true,
      voucherCode: textVoucher.text,
      // product: ,
    );
    if (result.status) {
      if (result.grandTotal == 0) {
        Get.dialog(
          dialogView(
            title: "Informasi",
            content: "Sukses. Ebook berhasil dibeli",
            onTapOke: () {
              Get.back();
              Get.back();
            },
          ),
        );
      } else {
        Get.toNamed(Routes.PAYMENT_EBOOK, arguments: result);
      }
    } else {
      Get.dialog(
        dialogView(
          title: "Kesalahan",
          content: "Gagal membeli ebook",
          onTapOke: () {
            Get.back();
          },
        ),
      );
    }
  }
}
