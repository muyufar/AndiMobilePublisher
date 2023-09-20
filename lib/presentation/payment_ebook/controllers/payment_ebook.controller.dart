import 'package:get/get.dart';
import 'package:andipublisher/app/data/models/payment_ebook_model.dart';
import 'package:flutter/material.dart';

class PaymentEbookController extends GetxController {
  //TODO: Implement PaymentEbookController
  final GlobalKey webViewKey = GlobalKey();

  late PaymentEbookModel paymentEbookModel;

  @override
  void onInit() {
    paymentEbookModel = Get.arguments;
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
}
