import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/splash.controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());

    return Scaffold(
      body: const Center(
        child: Text(
          'Selamat Datang di Andi Publiser',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
