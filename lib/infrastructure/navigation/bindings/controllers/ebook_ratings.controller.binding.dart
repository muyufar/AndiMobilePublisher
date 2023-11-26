import 'package:get/get.dart';

import '../../../../presentation/ebook_ratings/controllers/ebook_ratings.controller.dart';

class EbookRatingsControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EbookRatingController>(
      () => EbookRatingController(),
    );
  }
}
