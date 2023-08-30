import 'package:andipublisher/app/data/models/payment_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  final GlobalKey webViewKey = GlobalKey();

  late PaymentModel paymentModel;

  @override
  void onInit() {
    paymentModel = Get.arguments;
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
