import 'package:andipublisher/app/controllers/utils_controller.dart';
import 'package:andipublisher/app/data/models/user_model.dart';
import 'package:andipublisher/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final UtilsController utilsController = Get.put(UtilsController());
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  // UserModel userModel = UserModel();
  @override
  void onInit() {
    // userModel = fetchUserModel();
    utilsController.initializeUserModel();
   
    super.onInit();
  }

  @override
  void onReady() {
    utilsController.getDataUser();
    // scaffoldKey = GlobalKey<ScaffoldState>();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onTapLogout() {
    utilsController.deleteDataUser();
    if (!utilsController.isLogin.value) {
      Get.toNamed(Routes.LOGIN);
    }
  }
}