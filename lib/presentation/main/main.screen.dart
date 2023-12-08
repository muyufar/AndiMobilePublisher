import 'package:andipublisher/app/views/views/badge_cart_view.dart';
import 'package:andipublisher/app/views/views/image_network_view.dart';
import 'package:andipublisher/infrastructure/navigation/routes.dart';
import 'package:andipublisher/infrastructure/theme/theme_utils.dart';
import 'package:andipublisher/infrastructure/theme/widget_decoration.theme.dart';
import 'package:andipublisher/presentation/screens.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import 'controllers/main.controller.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // Get.put(MainController());

    return Obx(() => WillPopScope(
          onWillPop: controller.onWillPop,
          child: Scaffold(
                body: SizedBox.expand(
                  child: PageView(
                    controller:
                        controller.navController.pageControllerPrimaryMain,
                    onPageChanged: (index) =>
                        controller.onPageChangedPageView(index),
                    children: [
                      HomeScreen(),
                      WishlistScreen(),
                      MainTransactionScreen(),
                      RakbukuScreen(),
                      ProfileScreen(),
                    ],
                  ),
                ),
                bottomNavigationBar: BottomNavigationBar(
                  currentIndex:
                      controller.navController.selectedIndexPrimaryMain.value,
                  onTap: (index) =>
                      controller.onItemSelectedBottomNavyBar(index),
                  selectedItemColor: colorPrimary,
                  unselectedItemColor: colorGrey,
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(Ionicons.home_outline), label: 'Home'),
                    BottomNavigationBarItem(
                        icon: Icon(Ionicons.heart_outline), label: 'Wishlist'),
                    BottomNavigationBarItem(
                        icon: Icon(Ionicons.file_tray_full_outline),
                        label: 'Transaksi'),
                    BottomNavigationBarItem(
                        icon: Icon(Ionicons.book_outline), label: 'Rak Buku'),
                    BottomNavigationBarItem(
                        icon: Icon(Ionicons.ellipsis_horizontal_outline),
                        label: 'Profile'),
                  ],
                ),
              ),
            ),
          );
  }

  AppBar? _appBar() {
    switch (controller.navController.selectedIndexPrimaryMain.value) {
      case 0:
        return AppBar(
          leading: (controller.utilsController.isLogin.value)
              ? IconButton(
                  icon: const Icon(
                    Ionicons.person_circle_outline,
                    color: Colors.white,
                    size: 30, // Warna ikon diatur menjadi putih
                  ),
                  onPressed: () {
                    if (controller.scaffoldKey?.currentState != null) {
                      controller.scaffoldKey?.currentState!.openDrawer();
                    }
                  },
                )
              : null,
          title: TextField(
            readOnly: true,
            decoration: inputInputDecorationRounded.copyWith(
              isDense: true,
              hintText: 'Pencarian',
              prefixIcon: const Icon(Ionicons.search, color: Colors.grey),
              fillColor: Colors.white,
            ),
            onTap: () => Get.toNamed(Routes.EBOOK_SEARCH),
          ),
          backgroundColor: colorPrimary,
          toolbarHeight: 70,
        );
      default:
        return null;
    }
  }
}
