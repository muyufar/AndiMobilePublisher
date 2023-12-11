import 'package:andipublisher/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

/// NotFoundView
///
/// This class is a Widget that displays a "Not Found" page.

/// Usage
///
/// To use this class, first you need to import it. Then, you can use it to display a "Not Found" page like this:
///
///
/// NotFoundView();
///
/// This code will display a "Not Found" page with an empty state Lottie animation and the text "Tidak ada Data yang di temukan".

class NotFoundView extends GetView {
  const NotFoundView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(Assets.lottie.emptyStatePage, width: 200, height: 200),
        const Text('Tidak ada Data yang di temukan')
      ],
    );
  }
}
