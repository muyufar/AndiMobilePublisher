import 'package:get/get.dart';

import '../../../../presentation/EbookPrimaryRatingsDetailScreen/controllers/ebook_primary_ratings_detail_screen.controller.dart';

class EbookPrimaryRatingsDetailScreenControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EbookPrimaryRatingsDetailScreenController>(
      () => EbookPrimaryRatingsDetailScreenController(),
    );
  }
}
