import 'package:andipublisher/gen/assets.gen.dart';
import 'package:andipublisher/infrastructure/navigation/routes.dart';
import 'package:andipublisher/infrastructure/theme/theme_utils.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

/// RequestLoginView
///
/// This class is a Widget that displays a "Request login" page.

/// Usage
///
/// To use this class, first you need to import it. Then, you can use it to display a "Request login" page like this:
///
///
/// RequestLoginView();
///
/// This code will display a "Request login" page with a Lottie animation and the text "Silakan Login terlebih dahulu ! ". When the user taps on the "Login" text, they will be navigated to the login page.

class RequestLoginView extends GetView {
  const RequestLoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
            child: Lottie.asset(Assets.lottie.login, width: Get.width / 1.8)),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Silakan Login terlebih dahulu ! '),
            GestureDetector(
              onTap: () => Get.toNamed(Routes.LOGIN),
              child: Text(
                'Login',
                style:
                    TextStyle(color: colorPrimary, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        )
      ],
    ));
  }
}
