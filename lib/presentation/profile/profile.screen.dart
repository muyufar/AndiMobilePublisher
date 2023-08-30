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

  Row _info() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10, left: 18),
          child: Image.asset(Assets.images.logo.path),
        ),
        // Container(
        //   margin: const EdgeInsets.only(right: 10, left: 18),
        //   height: 80,
        //   width: 80,
        //   decoration: BoxDecoration(color: colorGrey, shape: BoxShape.circle),
        // ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Andipublisher',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text('Andipublishercom@yahoo.com'),
          ],
        )
      ],
    );
  }
}
