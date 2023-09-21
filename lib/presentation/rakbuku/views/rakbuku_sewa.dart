import 'package:andipublisher/presentation/rakbuku/controllers/rakbuku.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Rakbukusewa extends GetView {
  Rakbukusewa({Key? key}) : super(key: key);

  @override
  final RakBukuController controller = Get.put(RakBukuController());

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [Text("Ebook Sewa")],
    );
  }
}
