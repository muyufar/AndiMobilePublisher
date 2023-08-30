import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavController extends GetxController {
  late PageController pageControllerPrimaryMain;
  late PageController pageControllerEBooksMain;
  RxInt selectedIndexPrimaryMain = 0.obs;
}
