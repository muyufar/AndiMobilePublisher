import 'package:andipublisher/app/data/models/ebook_list_history_transaction_model.dart';
import 'package:andipublisher/app/data/services/ebook_rating_service.dart';
import 'package:andipublisher/app/views/views/ebook_card_ratings_view.dart';
import 'package:andipublisher/gen/assets.gen.dart';
import 'package:andipublisher/infrastructure/theme/theme_utils.dart';
import 'package:andipublisher/presentation/ebook_ratings/controllers/ebook_ratings.controller.dart';
import 'package:andipublisher/presentation/ebook_ratings/views/ebook_rating_not_rated.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lottie/lottie.dart';

class EbookRatingsScreen
    extends GetView<EbookRatingController> {
  const EbookRatingsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _background(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: _appBar(),
          body: Obx(() => Column(
                children: [
                  SizedBox(
                    height: 46,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      children: [
                        _categoryPage(title: 'Belum Dinilai', value: 1),
                        _categoryPage(title: 'Penilaian Saya', value: 2),
                        _categoryPage(title: 'Dari Penjual', value: 3),
                      ],
                    ),
                  ),
                  (controller.initPage.value == 1)
                      ? EbookRatingView()
                      : const SizedBox(),
                  (controller.initPage.value == 2)
                      ? EbookRatingView()
                      : const SizedBox(),
                  (controller.initPage.value == 3)
                      ? EbookRatingView()
                      : const SizedBox(),
                ],
              )),
        )
      ],
    );
  }

  Widget _categoryPage({required String title, required int value}) {
    return GestureDetector(
      onTap: () => controller.initPage.value = value,
      child: Container(
        height: 28,
        width: 120,
        margin: const EdgeInsets.symmetric(horizontal: 6),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: controller.initPage.value == value
                ? colorPrimary
                : Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
            border: controller.initPage.value == value
                ? const Border()
                : Border.all(color: Colors.grey),
            boxShadow: [
              controller.initPage.value == value
                  ? const BoxShadow(
                      color: Colors.grey, blurRadius: 4, offset: Offset(2, 4))
                  : const BoxShadow()
            ]),
        child: Text(
          title,
          style: TextStyle(
              color: controller.initPage.value == value
                  ? Colors.white
                  : Colors.grey),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text('Penilaian Saya'),
      automaticallyImplyLeading: false,
      centerTitle: false,
      leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Ionicons.chevron_back_outline)),
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.white,
      elevation: 0,
    );
  }

  Widget _background() {
    return Stack(
      children: [
        Container(
          height: Get.height,
          width: Get.width,
          color: Colors.grey.shade100,
        ),
        Container(
          height: 110,
          decoration: BoxDecoration(
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(28)),
            image: DecorationImage(
                image: AssetImage(Assets.images.banerDefault.path),
                fit: BoxFit.cover),
          ),
        ),
      ],
    );
  }
}
