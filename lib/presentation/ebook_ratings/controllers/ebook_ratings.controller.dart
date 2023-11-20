import 'package:andipublisher/app/data/models/ebook_rating_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EbookRatingsController extends GetxController {
  RxList<EbookRatingModel> EbookRatingModels = 
  RxList<EbookRatingModel>();

  TextEditingController descriptionTextEditingController = TextEditingController();

  RxString idReview = ''.obs;
  RxString value = ''.obs;
  RxBool isNameHidden = false.obs;
  RxInt likes = 0.obs;
  //TODO: Implement EbookRatingsController

  final count = 0.obs;
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

  void increment() => count.value++;
}
