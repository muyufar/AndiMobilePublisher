import 'dart:io';

import 'package:andipublisher/app/controllers/utils_controller.dart';
import 'package:andipublisher/app/controllers/validator_controller.dart';
import 'package:andipublisher/app/data/models/user_model.dart';
import 'package:andipublisher/app/data/services/user_service.dart';
import 'package:andipublisher/app/views/views/dialog_view.dart';
import 'package:andipublisher/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RegisterController extends GetxController {
  final ValidatorController validatorController =
      Get.put(ValidatorController());

  TextEditingController fullNameTextEditingController = TextEditingController();
  TextEditingController numberTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController confirmationPasswordTextEditingController =
      TextEditingController();

  RxBool obscureTextPassword = false.obs;
  RxBool obscureTextConfirmationPassword = false.obs;

  final UtilsController utilsController = Get.put(UtilsController());
  final formKey = GlobalKey<FormState>();

  final ImagePicker _picker = ImagePicker();
  XFile? image;
  RxString? pathImage = ''.obs;

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

  Future<XFile?> getImage() async {
    var image = await _picker.pickImage(source: ImageSource.gallery);
    pathImage!.value = image?.path ?? '';
    return image;
  }

  void onTapDeteleImage() {
    image = null;
    pathImage!.value = '';
  }

  Future<void> onTapRegister() async {
UserModel result = await UserService.register(
        name: sendArguments['name'] ?? '',
        noPhone: sendArguments['number'] ?? '',
        email: sendArguments['email'] ?? '',
        password: sendArguments['password'] ?? '',
  imageProfile: File(image?.path ?? ''),
);

Get.dialog(
  dialogView(
    title: 'Berhasil Daftar',
    content: result,
    onTapOke: () {
      Get.back();
      Get.back();
      Get.back();
      Get.back();
    },
  ),
);
  }
