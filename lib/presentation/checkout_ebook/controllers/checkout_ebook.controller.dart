import 'package:andipublisher/app/data/models/checkout_ebook_model.dart';
import 'package:andipublisher/app/data/models/data_ebook_checkout_model.dart';
import 'package:andipublisher/app/data/models/ebook_master_model.dart';
import 'package:andipublisher/app/data/models/payment_ebook_model.dart';
import 'package:andipublisher/app/data/services/transaction_ebook_service.dart';
import 'package:andipublisher/infrastructure/navigation/routes.dart';
import 'package:get/get.dart';

class CheckoutEbookController extends GetxController {
  CheckoutEbookModel checkoutEbookModel = Get.arguments;
  RxInt hargaTotalProduct = 0.obs;
  RxInt diskonTotalProduct = 0.obs;
  RxList<int> totalDiscount = <int>[].obs;
  RxList<int> priceSubTotalItmes = <int>[].obs;

  //TODO: Implement CheckoutEbookController

  final count = 0.obs;
  @override
  void onInit() {
    setPriceTotalItmes();
    calculateTotalDiscount();
    super.onInit();
  }

  @override
  void onReady() {
    hargaTotalProduct.value =
        priceSubTotalItmes.reduce((value, element) => value + element);
    diskonTotalProduct.value =
        totalDiscount.reduce((value, element) => value + element);
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setPriceTotalItmes() {
    for (DataEbookCheckout dataEbookCheckout
        in checkoutEbookModel.dataEbookCheckout) {
      for (Item item in dataEbookCheckout.items) {
        priceSubTotalItmes.add(item.harga);
      }
    }
  }

  void calculateTotalDiscount() {
    for (DataEbookCheckout dataEbookCheckout
        in checkoutEbookModel.dataEbookCheckout) {
      for (Item item in dataEbookCheckout.items) {
        totalDiscount.add(item.diskon);
      }
    }
  }

  Future<void> onTapSelectPayment() async {
    // validator

    List<DataEbookCheckoutMolde> dataEbookCheckout = [];
    List<Product> products = [];

    for (var product in checkoutEbookModel.dataEbookCheckout[0].items) {
      Product valueProduct = Product(idProduct: product.idBarang);
      products.add(valueProduct);
    }

    DataEbookCheckoutMolde valueDataEbookCheckoutMolde =
        DataEbookCheckoutMolde(products: products);

    dataEbookCheckout.add(valueDataEbookCheckoutMolde);

    PaymentEbookModel result = await TransactionEbookService.postPayment(
      usePoinUser: false,
      dataEbookCheckout: dataEbookCheckout,
      isVoucher: true,
    );
    Get.toNamed(Routes.PAYMENT, arguments: result);
  }
}
