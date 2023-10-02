import 'package:andipublisher/app/views/views/app_bar_view.dart';
import 'package:andipublisher/app/views/views/request_login_view.dart';
import 'package:andipublisher/app/views/views/whislist_ebook_view.dart';
import 'package:andipublisher/extensions/int_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/wishlist.controller.dart';

class WishlistScreen extends GetView<WishlistController> {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(WishlistController());

    return Scaffold(
      appBar: appBarStandar(title: 'Wishlist', context: context),
      body: Obx(() {
        // Periksa apakah pengguna sudah login
        if (!controller.utilsController.isLogin.value) {
          // Jika belum login, tampilkan pesan atau widget yang sesuai
          return const Center(
            child: RequestLoginView(), // Tampilkan widget RequestLoginView
          );
        }

        // Jika pengguna sudah login, tampilkan daftar wishlist
        return _buildWishlist();
      }),
    );
  }

Widget _buildWishlist() {
  return Obx(() {
    final wishlist = controller.wishlist;
    if (wishlist.isEmpty) {
      // Jika wishlist kosong, tampilkan pesan kosong
      return const Center(
        child: Text('Wishlist Anda kosong.'),
      );
    } else {
      // Jika ada item dalam wishlist, tampilkan daftar item dalam bentuk CardEbookView
      return GridView.builder(
         shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(20),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 1 / 1,
        mainAxisExtent: Get.height / 2.6, 
        mainAxisSpacing: 0,
      ),
        itemCount: wishlist.length,
        itemBuilder: (context, index) {
          final ebookItem = wishlist[index];
          return WhislistCardEbookView(
            ebookItem: ebookItem,
            onRemove: () {
              // Tambahkan logika untuk menghapus item dari wishlist di sini
              controller.removeFromWishlist(ebookItem); // Panggil fungsi yang sesuai di controller
            },
          );
        },
      );
    }
  });
}




}
