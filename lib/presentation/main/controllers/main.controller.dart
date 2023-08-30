import 'package:andipublisher/app/controllers/nav_controller.dart';
import 'package:andipublisher/app/controllers/utils_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  final NavController navController = Get.put(NavController());
  final UtilsController utilsController = Get.put(UtilsController());

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void onInit() {
    navController.pageControllerPrimaryMain = PageController();
    super.onInit();
  }

  @override
  void onReady() {
    utilsController.getDataUser();
    scaffoldKey = GlobalKey<ScaffoldState>();
    super.onReady();
  }

  @override
  void onClose() {
    navController.pageControllerPrimaryMain.dispose();
    super.onClose();
  }

  void onItemSelectedBottomNavyBar(int index) {
    navController.selectedIndexPrimaryMain.value = index;
    navController.pageControllerPrimaryMain.jumpToPage(index);
  }

  void onPageChangedPageView(int index) {
    navController.selectedIndexPrimaryMain.value = index;
  }
}
