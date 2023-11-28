import 'package:andipublisher/infrastructure/theme/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

/// appBarDefault
///
/// This method creates a default AppBar.

/// Parameters
///
/// * `title`: The title of the AppBar.
/// * `leadign`: Whether to show the leading icon button.

/// Returns
///
/// An AppBar widget.

/// Usage
///
/// To use this method, you first need to import it. Then, you can use it to create a default AppBar like this:
///
///
/// appBarDefault(title: 'My App');
///
/// This code will create an AppBar with the title 'My App'.

appBarDefault({required String title, bool leadign = false}) {
  return PreferredSize(
    preferredSize: Size(Get.width, AppBar().preferredSize.height + 60),
    child: const SizedBox(),
  );
}

/// appBarStandar
///
/// This method creates a standard AppBar.

/// Parameters
///
/// * `title`: The title of the AppBar.
/// * `context`: The BuildContext of the AppBar.

/// Returns
///
/// An AppBar widget.

/// Usage
///
/// To use this method, you first need to import it. Then, you can use it to create a standard AppBar like this:
///
///
/// appBarStandar(title: 'My App', context: context);
///
/// This code will create an AppBar with the title 'My App' and the back button.
///
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
