import 'package:andipublisher/app/views/views/badge_cart_view.dart';
import 'package:andipublisher/infrastructure/navigation/routes.dart';
import 'package:andipublisher/infrastructure/theme/theme_utils.dart';
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
              border: Border(top: BorderSide(color: colorGrey)),
            ),
            child: Obx(() {
              final isEbookReady =
                  controller.ebookMasterDetailModel.value?.isReady ?? false;

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: Get.width / 1.1,
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
                      child: const Text('Beli Sekarang'),
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
          color: colorBlack,
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
