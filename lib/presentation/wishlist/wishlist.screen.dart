import 'package:andipublisher/app/views/views/app_bar_view.dart';
import 'package:andipublisher/app/views/views/request_login_view.dart';
import 'package:andipublisher/app/views/views/whislist_ebook_view.dart';
import 'package:andipublisher/extensions/int_extension.dart';
import 'package:andipublisher/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'controllers/wishlist.controller.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final WishlistController wishlistController = WishlistController();

    // Panggil getWishlistData saat membangun widget
    wishlistController.getWishlistData();

    return Scaffold(
      appBar: appBarStandar(title: 'Wishlist', context: context),
      body: Obx(() {
        // Periksa apakah pengguna sudah login
        if (!wishlistController.utilsController.isLogin.value) {
          // Jika belum login, tampilkan pesan atau widget yang sesuai
          return const Center(
            child: RequestLoginView(), // Tampilkan widget RequestLoginView
          );
        }

        if (wishlistController.isLoading.value) {
          // Tampilkan indikator loading saat data sedang diambil
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          // Jika pengguna sudah login dan data sudah diambil, tampilkan daftar wishlist
          return _buildWishlist(wishlistController);
        }
      }),
    );
  }

  Widget _buildWishlist(WishlistController wishlistController) {
    final wishlist = wishlistController.wishlist;
    if (wishlist.isEmpty) {
      // Jika wishlist kosong, tampilkan pesan kosong
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(height: 10),
            Lottie.asset(Assets.lottie.emptyStatePage, width: 200, height: 200),
            Text('Belum ada Ebook di Wishlist'),
          ],
        ),
      );
    } else {
      // Jika ada item dalam wishlist, tampilkan daftar item dalam bentuk CardEbookView
      return SingleChildScrollView(
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(20),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1 / 1,
            mainAxisExtent: Get.height / 2.4,
            mainAxisSpacing: 0,
          ),
          itemCount: wishlist.length,
          itemBuilder: (context, index) {
            final ebookItem = wishlist[index];
            return WhislistCardEbookView(
              ebookItem: ebookItem,
              onRemove: () {
                // Tambahkan logika untuk menghapus item dari wishlist di sini
                wishlistController.removeFromWishlist(ebookItem);
                Get.back();
                wishlistController
                    .getWishlistData(); // Panggil fungsi yang sesuai di controller
              },
            );
          },
        ),
      );
    }
  }
}
