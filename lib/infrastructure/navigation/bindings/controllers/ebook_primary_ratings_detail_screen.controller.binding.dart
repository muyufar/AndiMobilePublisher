import 'package:get/get.dart';

import '../../../../presentation/ebook_ratings_detail/controllers/ebook_rating_detail_screen.controller.dart';

class EbookPrimaryRatingsDetailScreenControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EbookRatingTransactionDetailScreenController>(
      () => EbookRatingTransactionDetailScreenController(),
    );
  }
}
