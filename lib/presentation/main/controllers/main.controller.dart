import 'package:andipublisher/app/controllers/nav_controller.dart';
import 'package:andipublisher/app/controllers/utils_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// MainController
///
/// This class is a controller for the main page.

/// Properties
///
/// * `navController`: The nav controller.
/// * `utilsController`: The utils controller.
/// * `scaffoldKey`: The scaffold key.

/// Methods
///
/// * `onItemSelectedBottomNavyBar`: Handles the bottom navy bar item selected event.
/// * `onPageChangedPageView`: Handles the page view changed event.

/// Usage
///
/// To use this class, first you need to import it. Then, you can instantiate it like this:
///
///
/// MainController controller = MainController();
///
/// This code will instantiate a MainController object.

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
    utilsController.getCountCart();
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
