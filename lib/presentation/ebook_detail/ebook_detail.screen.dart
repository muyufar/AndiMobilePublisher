import 'package:andipublisher/app/data/models/ebook_master_model.dart';
import 'package:andipublisher/app/views/views/badge_cart_view.dart';
import 'package:andipublisher/app/views/views/rating_product_view.dart';
import 'package:andipublisher/infrastructure/navigation/routes.dart';
import 'package:andipublisher/infrastructure/theme/theme_utils.dart';
import 'package:andipublisher/presentation/checkout_ebook/checkout_ebook.screen.dart';
import 'package:andipublisher/presentation/checkout_ebook/controllers/checkout_ebook.controller.dart';
import 'package:andipublisher/presentation/ebook_detail/controllers/ebook_detail.controller.dart';
import 'package:andipublisher/presentation/ebook_detail/views/ebook_content_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animated_button/animated_button.dart';
import 'package:ionicons/ionicons.dart';

class EbookDetailScreen extends GetView<EbookDetailController> {
  const EbookDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(EbookDetailController());
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                _appBar(),
                EbookContentView(),
              ],
            ),
          ),
          Container(
            height: 58,
            decoration: BoxDecoration(
              color: Colors.white,
              // border: Border(top: BorderSide(color: colorGrey)),
            ),
            child: Obx(() {
              final isEbookReady =
                  controller.ebookMasterDetailModel.value?.isReady ?? false;

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Tombol Chat
                  ElevatedButton.icon(
                    onPressed: () {
                      // Implementasikan logika untuk membuka WhatsApp di sini
                      controller.utilsController.onTapChatWa();
                    },
                    style: ElevatedButton.styleFrom(
                      primary:
                          Colors.green, // Ganti warna sesuai keinginan Anda
                      onPrimary: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ), // Sesuaikan sesuai keinginan Anda
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            13), // Sesuaikan dengan keinginan Anda
                      ),
                    ),
                    icon: Icon(
                      Icons.chat,
                      size: 24, // Sesuaikan ukuran ikon sesuai keinginan Anda
                    ),
                    label: SizedBox.shrink(), // Hapus label
                  ),

                  // Spasi di antara tombol
                  // SizedBox(width: 5),

                  // Tombol Beli
                  SizedBox(
                    width: Get.width / 1.5,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        if (!controller.utilsController.isLogin.value) {
                          // Jika pengguna belum login, arahkan ke layar login
                          Get.toNamed(Routes.LOGIN);
                        } else {
                          // Jika pengguna sudah login dan ebook siap, lakukan tindakan pembelian
                          if (isEbookReady) {
                            controller.onTapBuyNow();
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: colorPrimary,
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              13), // Sesuaikan dengan keinginan Anda
                        ),
                      ),
                      child: const Text(
                        'Beli Sekarang',
                        style: TextStyle(
                          fontSize:
                              15, // Ganti ukuran teks sesuai keinginan Anda
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }

  Row _appBar() {
    return Row(
      children: [
        IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Ionicons.chevron_back),
          color: colorPrimary,
        ),

        const Spacer(),
        // if (controller.utilsController.isLogin.value)
        //   BadgeCartView(
        //     color: colorBlack,
        //   )
        // else
        const SizedBox(),
      ],
    );
  }
}
