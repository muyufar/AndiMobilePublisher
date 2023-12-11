import 'package:andipublisher/gen/assets.gen.dart';
import 'package:andipublisher/presentation/profile/views/profile_options_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/profile.controller.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final controller = Get.find<ProfileController>();

    Get.put(ProfileController());

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 20),
          children: [
            _info(),
            const SizedBox(height: 20),
            ProfileOptionsView(),
          ],
        ),
      ),
    );
  }

  Widget _info() {
    final userModel = controller.utilsController.userModel;
    final defaultNama = "AndiPublisher";
    final defaultEmail = "andipublisher@gmail.com";

    final namaUser = userModel?.namaUser ?? defaultNama;
    final emailUser = userModel?.emailUser ?? defaultEmail;

    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10, left: 18),
          child: Image.asset(
            Assets.images.logo.path,
            width: 50, // Ubah ukuran sesuai keinginan Anda
            height: 50, // Ubah ukuran sesuai keinginan Anda
          ),
        ),
         Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              namaUser,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(emailUser),
          ],
        ),
      ],
    );
  }
}