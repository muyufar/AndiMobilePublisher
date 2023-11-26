import 'package:andipublisher/presentation/home/views/home_category_view.dart';
import 'package:andipublisher/presentation/home/views/home_ebook_view.dart';
import 'package:andipublisher/presentation/home/views/home_menu_view.dart';
import 'package:andipublisher/presentation/home/views/home_product_digital_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());

    return TabBarView(
      children: [
        HomeEbookView(),
        HomeMenuView(),
        // HomeCategoryView(),
        // HomeProductDigitalView(),
      ],
    );
  }
}
