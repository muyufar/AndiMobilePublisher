import 'package:andipublisher/infrastructure/theme/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

appBarDefault({required String title, bool leadign = false}) {
  return PreferredSize(
    preferredSize: Size(Get.width, AppBar().preferredSize.height + 60),
    child: const SizedBox(),
  );
}

AppBar appBarStandar({String title = '', required BuildContext context}) {
  return AppBar(
    foregroundColor: colorBlack,
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Text(title),
    centerTitle: true,
    automaticallyImplyLeading: false,
    leading: Navigator.canPop(context)
        ? IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Ionicons.chevron_back),
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          )
        : null,
  );
}
