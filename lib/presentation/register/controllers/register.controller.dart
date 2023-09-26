import 'dart:io';
import 'package:andipublisher/app/controllers/utils_controller.dart';
import 'package:andipublisher/app/controllers/validator_controller.dart';
import 'package:andipublisher/app/data/services/user_service.dart';
import 'package:andipublisher/app/views/views/dialog_view.dart';
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
Future<void> onTapRegister() async {
  final result = await UserService.register(
    name: fullNameTextEditingController.text,
    noPhone: numberTextEditingController.text,
    email: emailTextEditingController.text,
    password: passwordTextEditingController.text,
    repassword: confirmationPasswordTextEditingController.text,
    // imageProfile: image != null ? File(image!.path) : null,
  );

  print("Registration Result: $result"); // Print the result to the console

  if (result['status'] == true) {
    Get.dialog(
      dialogView(
        title: "Berhasil",
        content: result, // Change this message as needed.
        onTapOke: () {
          Get.back();
          Get.back();
          Get.back();
        },
      ),
    );
  } else {
    // Handle other response codes or errors here.
    // You can show a different dialog or take other actions as needed.
  }
}


}