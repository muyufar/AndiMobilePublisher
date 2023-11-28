import 'package:andipublisher/app/data/models/ebook_list_history_transaction_model.dart';
import 'package:andipublisher/app/data/services/ebook_rating_service.dart';
import 'package:andipublisher/app/views/views/ebook_card_ratings_view.dart';
import 'package:andipublisher/app/views/views/request_login_view.dart';
import 'package:andipublisher/gen/assets.gen.dart';
import 'package:andipublisher/infrastructure/theme/theme_utils.dart';
import 'package:andipublisher/presentation/ebook_ratings/controllers/ebook_ratings.controller.dart';
import 'package:andipublisher/presentation/ebook_ratings/views/ebook_rating_not_rated.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lottie/lottie.dart';

class EbookRatingsScreen extends GetView<EbookRatingController> {
  const EbookRatingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(EbookRatingController());

    return Obx(
      () => (!controller.utilsController.isLogin.value)
          ? Scaffold(
              appBar: AppBar(
                title: const Text('Penilaian'),
              ),
              body: const RequestLoginView(),
            )
          : Scaffold(
              appBar: AppBar(
                title: const Text('Penilaian'),
              ),
              body: EbookRatingView(),
            ),
    );
  }
}