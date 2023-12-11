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
            ),
            child: Obx(() {
              final isEbookReady =
                  controller.ebookMasterDetailModel.value?.isReady ?? false;
              final isInBookShelf = controller
                      .ebookMasterDetailModel.value?.isInBookShelf?.owned ??
                  false;
              final isReviewAble = controller
                      .ebookMasterDetailModel.value?.isReviewAble?.status ??
                  false;

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      controller.utilsController.onTapChatWa();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      onPrimary: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                    ),
                    icon: Icon(
                      Icons.chat,
                      size: 24,
                    ),
                    label: SizedBox.shrink(),
                  ),
                  SizedBox(
                    width: Get.width / 1.5,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        if (!controller.utilsController.isLogin.value) {
                          Get.toNamed(Routes.LOGIN);
                        } else {
                          if (!isInBookShelf && isEbookReady) {
                            controller.onTapBuyNow();
                          } else if (isInBookShelf &&
                              isEbookReady &&
                              !isReviewAble) {
                            // controller.ebookfetchDetailTransaction();
                            Get.toNamed(Routes.RAKBUKU,
                                // arguments: controller
                                //     .ebookMasterDetailModel
                                //     .value
                                //     ?.idBarang
                                    );
                          } else if (isInBookShelf &&
                              isEbookReady &&
                              isReviewAble) {
                            // Handle case where book is in bookshelf, ready, and needs review
                            // For example, navigate to the review screen
                            controller.ebookfetchDetailTransaction();
                            Get.toNamed(Routes.EBOOK_RATINGS_INPUT,
                                arguments: controller
                                    .ebookMasterDetailModel
                                    .value?.isReviewAble!
                                    .idTransaction);
                          } else {
                            // Handle any other case
                            // You may want to add specific logic for other scenarios
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: colorPrimary,
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                      ),
                      child: Text(
                        () {
                          if (!isInBookShelf || !isEbookReady) {
                            return 'Beli Sekarang';
                          } else if (isInBookShelf &&
                              isEbookReady &&
                              isReviewAble) {
                            return 'Beri Rating';
                          } else if (isInBookShelf &&
                              isEbookReady &&
                              !isReviewAble) {
                            return 'Baca Buku';
                          } else {
                            return '';
                          }
                        }(),
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  )
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
        const SizedBox(), // You can add BadgeCartView or other widgets here
      ],
    );
  }
}
