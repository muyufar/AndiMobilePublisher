import 'package:andipublisher/gen/assets.gen.dart';
import 'package:andipublisher/presentation/profile/views/profile_options_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/profile.controller.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
    ));
  }

Widget _info() {
    return Column(
      children: [
        CircleAvatar(
          radius: 50, // Ubah ukuran avatar sesuai keinginan Anda
          backgroundImage: AssetImage(Assets.images.logo.path),
        ),
        const SizedBox(height: 15),
        Text(
          controller.utilsController.userModel.namaUser,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(controller.utilsController.userModel.emailUser),
      ],
    );
  }
}

