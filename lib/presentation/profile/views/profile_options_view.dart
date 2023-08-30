import 'package:andipublisher/infrastructure/navigation/routes.dart';
import 'package:andipublisher/infrastructure/theme/theme_utils.dart';
import 'package:andipublisher/presentation/profile/controllers/profile.controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class ProfileOptionsView extends GetView {
  ProfileOptionsView({Key? key}) : super(key: key);

  @override
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          _listTile(
            icon: Ionicons.barcode_outline,
            title: 'Blog',
            onTap: () {},
          ),
          _listTile(
            icon: Ionicons.logo_whatsapp,
            title: 'Kontak',
            onTap: () {},
          ),
          _listTile(
            icon: Ionicons.bag_handle_outline,
            title: 'Pusat Bantuan',
            onTap: () {},
          ),
          _listTile(
            icon: Ionicons.reader_outline,
            title: 'Lisensi',
            onTap: () {},
          ),
          _listTile(
            icon: Ionicons.book_outline,
            title: 'S & K',
            onTap: () {},
          ),
          _listTile(
            icon: Ionicons.attach_outline,
            title: 'Tentang',
            onTap: () {},
          ),
          const Divider(),
          (!controller.utilsController.isLogin.value)
              ? _listTile(
                  icon: Ionicons.log_in_outline,
                  title: 'Login',
                  onTap: () => Get.toNamed(Routes.LOGIN),
                )
              : _listTile(
                  icon: Ionicons.log_out_outline,
                  title: 'Logout',
                  onTap: () => controller.onTapLogout(),
                ),
        ],
      ),
    );
  }

  ListTile _listTile(
      {required String title,
      required IconData icon,
      required Function() onTap}) {
    return ListTile(
      horizontalTitleGap: 0,
      // contentPadding: EdgeInsets.zero,
      // visualDensity: const VisualDensity(vertical: ),
      onTap: onTap,
      leading: Icon(icon, color: colorBlack),
      iconColor: colorBlack,
      title: Text(title),
    );
  }
}
