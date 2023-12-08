import 'package:andipublisher/app/controllers/nav_controller.dart';
import 'package:andipublisher/app/controllers/utils_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  final NavController navController = Get.put(NavController());
  final UtilsController utilsController = Get.put(UtilsController());

  GlobalKey<ScaffoldState>? scaffoldKey;
  DateTime? currentBackPressTime;

  @override
  void onInit() {
    navController.pageControllerPrimaryMain = PageController();
    super.onInit();
  }

  @override
  void onReady() {
    utilsController.getDataUser();
    scaffoldKey = utilsController.mainScaffoldKey; // Menggunakan mainScaffoldKey dari UtilsController
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
    Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Get.snackbar('Keluar Apps', 'klik lagi tombol back untuk keluar aplikasi',
          duration: Duration(seconds: 2),
          backgroundColor: Colors.black,
          colorText: Colors.white);
      return Future.value(false);
    }
    return Future.value(true);
  }
}
