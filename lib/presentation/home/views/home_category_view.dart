import 'package:andipublisher/presentation/home/controllers/home.controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomeCategoryView extends GetView {
  HomeCategoryView({Key? key}) : super(key: key);
  @override
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [],
    );
  }
}
