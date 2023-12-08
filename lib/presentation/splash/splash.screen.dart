import 'package:flutter/material.dart';
import 'package:andipublisher/gen/assets.gen.dart';

import 'package:get/get.dart';

import 'controllers/splash.controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey, // warna bayangan
                    blurRadius: 5, // radius blur
                    spreadRadius: 2, // seberapa jauh bayangan tersebar
                    offset: Offset(0, 3), // posisi bayangan (x, y)
                  ),
                ],
              ),
              child: Image.asset(
                Assets.images.logosplashscreen.path,
                width: 150,
                height: 150,
              ),
            ),

            SizedBox(height: 16), // Jarak antara logo dan teks
            Text(
              'Andi Publisher Mobile', // Ganti dengan teks yang diinginkan
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
