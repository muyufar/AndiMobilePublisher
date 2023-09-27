import 'package:andipublisher/app/views/views/badge_cart_view.dart';
import 'package:andipublisher/infrastructure/theme/theme_utils.dart';
import 'package:andipublisher/presentation/ebook_detail/controllers/ebook_detail.controller.dart';
import 'package:andipublisher/presentation/ebook_detail/views/ebook_content_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class EbookDetailScrenn extends GetView<EbookDetailController> {
  const EbookDetailScrenn({Key? key}) : super(key: key);
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
                border: Border(top: BorderSide(color: colorGrey))),
            child: Obx(() => (controller.ebookMasterDetailModel.value != null)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // IconButton(
                      //     onPressed: () {},
                      //     icon: const Icon(Ionicons.chatbubble_outline)),
                      // Text(
                      //   '|',
                      //   style: TextStyle(
                      //       color: colorGrey,
                      //       fontSize: 20,
                      //       fontWeight: FontWeight.w200),
                      // ),
                      // IconButton(
                      //     onPressed: (controller
                      //             .ebookMasterDetailModel.value!.isReady)
                      //         ? () =>
                      //             controller.onTapBottomSheetOrder(isBuy: false)
                      //         : null,
                      //     icon: const Icon(Ionicons.cart_outline)),
                      SizedBox(
                          width: Get.width / 1.1,
                          child: ElevatedButton(
                              onPressed: (controller
                                      .ebookMasterDetailModel.value!.isReady)
                                  ? () => controller.onTapBottomSheetOrder(
                                      isBuy: true)
                                  : null,
                              child: const Text('Beli Sekarang')))
                    ],
                  )
                : const SizedBox()),
          )
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
        // IconButton(
        //   padding: const EdgeInsets.only(top: 14),
        //   onPressed: () {},
        //   icon: const Icon(Ionicons.share_social_outline),
        //   color: colorBlack,
        // ),
        IconButton(
          padding: const EdgeInsets.only(top: 14),
          onPressed: () {},
          icon: const Icon(Ionicons.heart_outline),
          color: colorBlack,
        ),
        (controller.utilsController.isLogin.value)
            ? BadgeCartView(
                color: colorBlack,
              )
            : const SizedBox(),
      ],
    );
  }
}
