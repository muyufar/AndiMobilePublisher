/// NavController
///
/// This class is a controller for the navigation of the application. It manages two page controllers, one for the primary main page and one for the ebooks main page. It also has an RxInt property that stores the currently selected index for the primary main page.

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavController extends GetxController {
  /// Constructor
  ///
  ///
  /// NavController() {
  ///   pageControllerPrimaryMain = PageController();
  ///   pageControllerEBooksMain = PageController();
  ///   selectedIndexPrimaryMain = 0.obs;
  /// }
  ///
  late PageController pageControllerPrimaryMain;
  late PageController pageControllerEBooksMain;
  RxInt selectedIndexPrimaryMain = 0.obs;

  /// Properties
  ///
  /// * pageControllerPrimaryMain: The page controller for the primary main page.
  /// * pageControllerEBooksMain: The page controller for the ebooks main page.
  /// * selectedIndexPrimaryMain: The currently selected index for the primary main page.

  /// Methods
  ///
  /// * navigateToPrimaryMainPage(int index): This method navigates to the specified index of the primary main page.
  /// * navigateToEBooksMainPage(int index): This method navigates to the specified index of the ebooks main page.

  /// Usage
  ///
  /// To use this class, you first need to instantiate it. Then, you can use the navigateToPrimaryMainPage() and navigateToEBooksMainPage() methods to navigate to the desired pages.
  ///
  /// For example, the following code navigates to the first page of the primary main page:
  ///
  ///
  /// NavController navController = Get.put(NavController());
  /// navController.navigateToPrimaryMainPage(0);
  /// ```
  ///
  /// This code will cause the page controller for the primary main page to scroll to the first page.
}
