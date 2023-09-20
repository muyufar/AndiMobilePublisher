import 'package:andipublisher/app/views/views/badge_cart_view.dart';
import 'package:andipublisher/app/views/views/image_network_view.dart';
import 'package:andipublisher/infrastructure/theme/theme_utils.dart';
import 'package:andipublisher/presentation/screens.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import 'controllers/main.controller.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(MainController());

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Obx(
        () => DefaultTabController(
          length: 4,
          child: Scaffold(
            key: controller.scaffoldKey,
            appBar: _appBar(),
            drawer: (controller.utilsController.isLogin.value)
                ? Drawer(
                    child: ListView(children: [
                      DrawerHeader(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                ImageNetworkView(
                                  url: controller
                                      .utilsController.userModel.fotoUser,
                                  height: 80,
                                  width: 80,
                                  margin: const EdgeInsets.only(bottom: 8),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      boxShadow: [boxShadow]),
                                ),
                                const Spacer(),
                                const Icon(Ionicons.diamond),
                                Text(
                                  controller.utilsController.userModel.poinUser
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 28,
                                      color: colorTextPrimary,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Spacer()
                              ],
                            ),
                            Text(
                              controller.utilsController.userModel.namaUser,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(controller.utilsController.userModel.emailUser)
                          ],
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Ionicons.create_outline),
                        title: const Text('Ubah Data'),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: const Icon(Ionicons.key_outline),
                        title: const Text('Ubah Password'),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: const Icon(Ionicons.map_outline),
                        title: const Text('Alamat'),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: const Icon(Ionicons.ticket_outline),
                        title: const Text('Voucher'),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ]),
                  )
                : null,
            body: SizedBox.expand(
              child: PageView(
                controller: controller.navController.pageControllerPrimaryMain,
                onPageChanged: (index) =>
                    controller.onPageChangedPageView(index),
                children: const [
                  HomeScreen(),
                  WishlistScreen(),
                  TransactionScreen(),
                  RakbukuScreen(),
                  ProfileScreen(),
                ],
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex:
                  controller.navController.selectedIndexPrimaryMain.value,
              onTap: (index) => controller.onItemSelectedBottomNavyBar(index),
              selectedItemColor: colorPrimary,
              unselectedItemColor: colorGrey,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Ionicons.home_outline), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Ionicons.heart_outline), label: 'Wishlist'),
                BottomNavigationBarItem(
                    icon: Icon(Ionicons.file_tray_full_outline),
                    label: 'Transaksi'),
                BottomNavigationBarItem(
                    icon: Icon(Ionicons.book_sharp), label: 'Rak Buku'),
                BottomNavigationBarItem(
                    icon: Icon(Ionicons.ellipsis_horizontal_outline),
                    label: 'Profile'),
              ],
            ),
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
                  icon: const Icon(Ionicons.person_circle_outline),
                  onPressed: () =>
                      controller.scaffoldKey.currentState!.openDrawer())
              : null,
          title: const TextField(
            readOnly: true,
            decoration: InputDecoration(hintText: 'Cari Sesuatu ...'),
          ),
          bottom: TabBar(
            isScrollable: true,
            labelColor: Colors.white,
            unselectedLabelColor: colorTextGrey,
            tabs: const [
              Tab(text: 'Menu'),
              Tab(text: 'E Book'),
              Tab(text: 'Kategori'),
              Tab(text: 'Produk Digital'),
            ],
          ),
          actions: [
            (controller.utilsController.isLogin.value)
                ? BadgeCartView()
                : const SizedBox(),
          ],
        );
      default:
        return null;
    }
  }
}
