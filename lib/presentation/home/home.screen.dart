import 'package:andipublisher/app/views/views/image_network_view.dart';
import 'package:andipublisher/infrastructure/navigation/routes.dart';
import 'package:andipublisher/infrastructure/theme/theme_utils.dart';
import 'package:andipublisher/infrastructure/theme/widget_decoration.theme.dart';
import 'package:andipublisher/presentation/home/views/home_category_view.dart';
import 'package:andipublisher/presentation/home/views/home_ebook_view.dart';
import 'package:andipublisher/presentation/home/views/home_menu_view.dart';
import 'package:andipublisher/presentation/home/views/home_product_digital_view.dart';
import 'package:andipublisher/presentation/main/controllers/main.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        Get.put(HomeController());

    return Obx(
      () => DefaultTabController(
        length: 2,
        child: Scaffold(
          key: controller.scaffoldKey,
          appBar: _appBar(),
          drawer: (controller.utilsController.isLogin.value)
              ? Drawer(
                  child: ListView(
                    children: [
                      DrawerHeader(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                ImageNetworkView(
                                  url:
                                      controller.utilsController.userModel.fotoUser,
                                  height: 80,
                                  width: 80,
                                  margin: const EdgeInsets.only(bottom: 8),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [boxShadow],
                                  ),
                                ),
                                const Spacer(),
                                // const Icon(Ionicons.diamond),
                                // Text(
                                //   controller.utilsController.userModel.poinUser
                                //       .toString(),
                                //   style: TextStyle(
                                //       fontSize: 28,
                                //       color: colorTextPrimary,
                                //       fontWeight: FontWeight.bold),
                                // ),
                                const Spacer()
                              ],
                            ),
                            Text(
                              controller.utilsController.userModel.namaUser,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                                controller.utilsController.userModel.emailUser),
                          ],
                        ),
                      ),
                      // ListTile(
                      //   leading: const Icon(Ionicons.create_outline),
                      //   title: const Text('Ubah Data'),
                      //   onTap: () {
                      //     Navigator.pop(context);
                      //   },
                      // ),
                      // ListTile(
                      //   leading: const Icon(Ionicons.key_outline),
                      //   title: const Text('Ubah Password'),
                      //   onTap: () {
                      //     Navigator.pop(context);
                      //   },
                      // ),
                      // ListTile(
                      //   leading: const Icon(Ionicons.map_outline),
                      //   title: const Text('Alamat'),
                      //   onTap: () {
                      //     Navigator.pop(context);
                      //   },
                      // ),
                      // ListTile(
                      //   leading: const Icon(Ionicons.ticket_outline),
                      //   title: const Text('Voucher'),
                      //   onTap: () {
                      //     Navigator.pop(context);
                      //   },
                      // ),
                    ],
                  ),
                )
              : null,
          body: HomeEbookView(),
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
