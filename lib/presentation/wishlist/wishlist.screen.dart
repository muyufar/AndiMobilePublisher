import 'package:andipublisher/app/views/views/app_bar_view.dart';
import 'package:andipublisher/app/views/views/request_login_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/wishlist.controller.dart';

class WishlistScreen extends GetView<WishlistController> {
  const WishlistScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(WishlistController());
    return Scaffold(
        appBar: appBarStandar(title: 'Wishlist', context: context),
        body: Obx(
          () => (!controller.utilsController.isLogin.value)
              ? const RequestLoginView()
              : const SizedBox(),
        ));
  }
}
