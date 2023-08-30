import 'package:andipublisher/app/controllers/utils_controller.dart';
import 'package:andipublisher/app/controllers/validator_controller.dart';
import 'package:andipublisher/app/data/models/user_model.dart';
import 'package:andipublisher/app/data/services/user_service.dart';
import 'package:andipublisher/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final ValidatorController validatorController =
      Get.put(ValidatorController());
  final UtilsController utilsController = Get.put(UtilsController());

  final formKey = GlobalKey<FormState>();

  late TextEditingController emailTextEditingController;
  late TextEditingController passTextEditingController;

  RxBool showPassowrd = false.obs;

  @override
  void onInit() {
    emailTextEditingController = TextEditingController();
    passTextEditingController = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailTextEditingController.dispose();
    passTextEditingController.dispose();
    super.onClose();
  }

  void oTapLogin() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    UserModel userModel = await UserService.login(
        email: emailTextEditingController.text,
        password: passTextEditingController.text);

    utilsController.saveDataUser(userModel: userModel);
    utilsController.getDataUser();

    if (utilsController.isLogin.value) {
      Get.offAllNamed(Routes.MAIN);
    }
  }
}
