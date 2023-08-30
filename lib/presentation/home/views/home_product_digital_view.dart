import 'package:andipublisher/presentation/main/controllers/main.controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomeProductDigitalView extends GetView {
  HomeProductDigitalView({Key? key}) : super(key: key);

  @override
  final MainController controller = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [],
    );
  }
}
