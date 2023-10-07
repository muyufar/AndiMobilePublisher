import 'package:andipublisher/infrastructure/navigation/routes.dart';
import 'package:andipublisher/presentation/profile/controllers/profile.controller.dart';
import 'package:andipublisher/presentation/profile/konten/faqAndi_view.dart';
import 'package:andipublisher/presentation/profile/konten/inginjadiPenulis_view.dart';
import 'package:andipublisher/presentation/profile/konten/kebijakanPrivasi_view.dart';
import 'package:andipublisher/presentation/profile/konten/kembaliProduk_view.dart';
import 'package:andipublisher/presentation/profile/konten/kontakkami_view.dart';
import 'package:andipublisher/presentation/profile/konten/pembelianbuku_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:url_launcher/url_launcher.dart';

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
            onTap: _launchBlogLink, // Ubah disini
          ),
          _listTile(
            icon: Ionicons.logo_whatsapp,
            title: 'Kontak Kami',
            onTap: () {
              Get.to(KontakKamiView());
            },
          ),
          _listTile(
            icon: Ionicons.bag_handle_outline,
            title: 'Cara Berbelanja',
            onTap: () {
              Get.to(CaraPembelianView());
            },
          ),
          _listTile(
            icon: Ionicons.reload_outline,
            title: 'Pengembalian Barang',
            onTap: () {
              Get.to(PengembalianProduk());
            },
          ),
          _listTile(
            icon: Ionicons.reader_outline,
            title: 'Ingin Jadi Penulis ?',
            onTap: () {
              Get.to(InginJadiPenulis());
            },
          ),
          _listTile(
            icon: Ionicons.book_outline,
            title: 'Kebijakan & Privasi',
            onTap: () {
              Get.to(KebijakanPrivasi());
            },
          ),
          _listTile(
            icon: Ionicons.attach_outline,
            title: 'FAQ',
            onTap: () {
              Get.to(FaqAndi());
            },
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
    onTap: onTap,
    leading: Icon(
      icon,
      color: Colors.black, // Ubah warna ikon sesuai kebutuhan
    ),
    title: Text(title),
  );
}


  void _launchBlogLink() async {
    const url = 'https://andipublisher.com/blog/list';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
