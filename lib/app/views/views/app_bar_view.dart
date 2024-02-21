import 'package:andipublisher/infrastructure/navigation/routes.dart';
import 'package:andipublisher/infrastructure/theme/theme_utils.dart';
import 'package:andipublisher/infrastructure/theme/widget_decoration.theme.dart';
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

Container _search(
    {TextEditingController? controller, Function(String)? onSubmitted}) {
  return Container(
    height: 40,
    margin: const EdgeInsets.symmetric(horizontal: 16),
    decoration: inputBoxDecorationRounded.copyWith(boxShadow: const [
      BoxShadow(color: Colors.grey, blurRadius: 4, offset: Offset(2, 4))
    ]),
    child: TextField(
      controller: controller,
      decoration: inputInputDecorationRounded.copyWith(
        hintText: 'Pencarian',
        isDense: true,
        prefixIcon: const Icon(Ionicons.search, color: Colors.grey),
      ),
      onSubmitted: onSubmitted,
    ),
  );
}

Widget appBarSearchAll({required String title, bool centerTitle = true}) {
  return SizedBox(
    height: 118,
    width: Get.width,
    child: Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: 100,
            width: Get.width,
            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(28)),
              color: colorPrimary,
            ),
            child: Row(
              children: [
                IconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(
                      Ionicons.chevron_back,
                      color: Colors.white,
                    )),
                Visibility(visible: centerTitle, child: Spacer()),
                Text(
                  title,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Visibility(visible: centerTitle, child: Spacer()),
                Visibility(visible: centerTitle, child: SizedBox(width: 24))
              ],
            ),
          ),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 40,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: inputBoxDecorationRounded.copyWith(boxShadow: const [
                BoxShadow(
                    color: Colors.grey, blurRadius: 4, offset: Offset(2, 4))
              ]),
              child: TextField(
                readOnly: true,
                decoration: inputInputDecorationRounded.copyWith(
                  hintText: 'Pencarian',
                  isDense: true,
                  prefixIcon: const Icon(Ionicons.search, color: Colors.grey),
                ),
                onTap: () => Get.toNamed(Routes.EBOOK_SEARCH),
              ),
            ))
      ],
    ),
  );
}

appBarSearchV2(
        {required String title,
        bool centerTitle = true,
        bool isImageBackground = false,
        bool isLeadingWidth = true,
        bool isAllSearch = false,
        Function(String)? onSubmitted,
        TextEditingController? controller}) =>
    PreferredSize(
      preferredSize: Size(Get.width, AppBar().preferredSize.height + 60),
      child: Stack(
        children: <Widget>[
          // Background
          Container(
            height: AppBar().preferredSize.height + 75,
            width: Get.width,
            decoration: BoxDecoration(
              color: colorPrimary,
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(28)),
            ),
            child: Row(
              children: [
                Visibility(
                  visible: isLeadingWidth,
                  child: IconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(
                      Ionicons.chevron_back,
                      color: Colors.white,
                    ),
                  ),
                ),
                Spacer(),
                Text(
                  title,
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
                Spacer(),
                Visibility(visible: isLeadingWidth, child: SizedBox(width: 46)),
              ],
            ),
          ),

          Container(), // Required some widget in between to float AppBar

          Positioned(
            // To take AppBar Size only
            top: 100.0,
            left: 20.0,
            right: 20.0,
            child: !(isAllSearch)
                ? _search(controller: controller, onSubmitted: onSubmitted)
                : Container(
                    height: 40,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: inputBoxDecorationRounded.copyWith(
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 4,
                              offset: Offset(2, 4))
                        ]),
                    child: TextField(
                      readOnly: true,
                      decoration: inputInputDecorationRounded.copyWith(
                        hintText: 'Pencarian',
                        isDense: true,
                        prefixIcon:
                            const Icon(Ionicons.search, color: Colors.grey),
                      ),
                      onTap: () => Get.toNamed(Routes.EBOOK_SEARCH),
                    ),
                  ),
          )
        ],
      ),
    );

appBarV2(
        {required String title,
        bool centerTitle = true,
        bool isImageBackground = false,
        bool isLeadingWidth = true,
        List<Widget>? actions,
        Widget? child}) =>
    PreferredSize(
      preferredSize: Size(Get.width, AppBar().preferredSize.height + 60),
      child: Stack(
        children: <Widget>[
          // Background
          Container(
            height: AppBar().preferredSize.height + 75,
            width: Get.width,
            decoration: BoxDecoration(
              color: colorPrimary,
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(28)),
            ),
            child: Row(
              children: [
                Visibility(
                  visible: isLeadingWidth,
                  child: IconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(
                      Ionicons.chevron_back,
                      color: Colors.white,
                    ),
                  ),
                ),
                Visibility(visible: centerTitle, child: Spacer()),
                Text(
                  title,
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
                Spacer(),
                Visibility(visible: isLeadingWidth, child: SizedBox(width: 46)),
                ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: actions?.length,
                  itemBuilder: (context, index) => actions?[index],
                )
              ],
            ),
          ),

          Container(), // Required some widget in between to float AppBar

          Positioned(
              // To take AppBar Size only
              top: 110.0,
              left: 20.0,
              right: 20.0,
              child: child ?? SizedBox())
        ],
      ),
    );