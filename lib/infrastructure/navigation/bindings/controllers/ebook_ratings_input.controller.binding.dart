import 'package:get/get.dart';

import '../../../../presentation/ebook_ratings_input/controllers/ebook_ratings_input.controller.dart';

class EbookRatingsInputControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EbookRatingsInputController>(
      () => EbookRatingsInputController(),
    );
  }
}
