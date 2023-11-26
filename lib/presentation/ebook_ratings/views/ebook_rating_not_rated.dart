import 'package:andipublisher/app/data/models/ebook_list_history_transaction_model.dart';
import 'package:andipublisher/app/data/services/ebook_rating_service.dart';
import 'package:andipublisher/app/views/views/ebook_card_ratings_view.dart';
import 'package:andipublisher/gen/assets.gen.dart';
import 'package:andipublisher/presentation/ebook_ratings/controllers/ebook_ratings.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class EbookRatingView extends GetView {
   EbookRatingView ({Key? key}) : super(key: key);

  @override
  final EbookRatingController controller =
      Get.put(EbookRatingController());

@override
  Widget build(BuildContext context) {
    return SizedBox(
        height: Get.height / 1.26,
        child: FutureBuilder(
          future: EbookratingService.getNotRatedList(tag: '5', offset: '0'),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              controller.ratingsNotRated.value =
                  snapshot.data as List<EbookListHistoryTransactionModel>;

              if (controller.ratingsNotRated.isNotEmpty) {
                return ListView.builder(
                  itemCount: controller.ratingsNotRated.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => CardEbookPrimaryRatingView(
                      data: controller.ratingsNotRated[index]),
                );
              } else {
                return Column(
                  children: [
                    Lottie.asset(Assets.lottie.emptyStatePage),
                    const Text('Tidak ada data')
                  ],
                );
              }
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
