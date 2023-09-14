import 'package:andipublisher/app/data/models/checkout_ebook_model.dart';
import 'package:get/get.dart';

class CheckoutEbookController extends GetxController {
  CheckoutEbookModel checkoutEbookModel = Get.arguments;
  RxInt hargaTotalProduct = 0.obs;
  RxInt diskonTotalProduct = 0.obs;
  RxList<int> priceSubTotalItmes = <int>[].obs;

  //TODO: Implement CheckoutEbookController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    hargaTotalProduct.value =
        priceSubTotalItmes.reduce((value, element) => value + element);
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setPriceTotalItmes() {
    for (DataCheckout dataCheckout in checkoutEbookModel.dataCheckout) {
      for (Item item in dataCheckout.items) {
        priceSubTotalItmes.add(item.subtotal);
      }
    }
  }
}
