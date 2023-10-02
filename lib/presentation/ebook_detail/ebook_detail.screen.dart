import 'package:andipublisher/app/views/views/badge_cart_view.dart';
import 'package:andipublisher/infrastructure/theme/theme_utils.dart';
import 'package:andipublisher/presentation/ebook_detail/controllers/ebook_detail.controller.dart';
import 'package:andipublisher/presentation/ebook_detail/views/ebook_content_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
              children: [_appBar(), EbookContentView()],
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
                      onPressed: isEbookReady
                          ? () => controller.onTapBottomSheetOrder(isBuy: true)
                          : null,
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
        IconButton(
          padding: const EdgeInsets.only(top: 14),
          onPressed: () {
            // Tambahkan atau hapus item dari Wishlist di sini
            if (controller.isInWishlist.isFalse) {
              controller.removeFromWishlist();
            } else {
              controller.addToWishlist();
            }
          },
          icon: Icon(
            Ionicons.heart_outline,
            color: controller.isInWishlist.isTrue ? Colors.red : colorBlack,
          ),
        ),
        if (controller.utilsController.isLogin.value)
          BadgeCartView(
            color: colorBlack,
          )
        else
          const SizedBox(),
      ],
    );
  }
}
