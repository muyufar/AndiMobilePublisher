import 'package:andipublisher/app/controllers/utils_controller.dart';
import 'package:andipublisher/app/data/models/checkout_ebook_model.dart';
import 'package:andipublisher/app/data/models/ebook_master_detail_model.dart';
import 'package:andipublisher/app/data/services/ebook_cart_service.dart';
import 'package:andipublisher/app/data/services/ebook_services.dart';
import 'package:andipublisher/app/data/services/transaction_ebook_service.dart';
import 'package:andipublisher/app/views/views/dialog_view.dart';
import 'package:andipublisher/infrastructure/navigation/routes.dart';
import 'package:andipublisher/presentation/ebook_detail/views/ebook_detail_bottom_sheet_order.dart';
import 'package:get/get.dart';

class EbookDetailController extends GetxController {
  final UtilsController utilsController = Get.put(UtilsController());

  Rxn<EbookMasterDetailModel> ebookMasterDetailModel =
      Rxn<EbookMasterDetailModel>();

  RxInt priceTotalOrder = 0.obs;

  late bool bottomSheetOrderIsBuy;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    priceTotalOrder.value = 0;

    super.onClose();
  }

  Future<EbookMasterDetailModel> fetchDetailItem() async {
    ebookMasterDetailModel.value =
        await EbookService.getEbookItemMasterDetail(id: Get.arguments);
    countPriceTotalOrder();
    return ebookMasterDetailModel.value!;
  }

  Future<void> onTapBuyNow() async {
    Get.back();
    CheckoutEbookModel checkoutEbookModel =
        await TransactionEbookService.postCheckout(
            tag: 'direck', ids: [ebookMasterDetailModel.value!.idBarang]);

    Get.toNamed(Routes.CHECKOUT_EBOOK, arguments: checkoutEbookModel);
  }

  Future<void> onTapAddCart() async {
    bool status = await EbookCartService.postAddCart(
      idBarang: ebookMasterDetailModel.value!.idBarang,
    );

    if (status) {
      utilsController.getCountCart();

      //Menutup bottomSheetOrder
      Get.back();
    }
  }

  void onTapBottomSheetOrder({required bool isBuy}) {
    //check user is Login
    if (!utilsController.isLogin.value) {
      Get.dialog(dialogView(
        title: 'Login',
        content: 'Silakan Login terlebih dahulu ! ',
        onTapOke: () {
          Get.back();
          Get.toNamed(Routes.LOGIN);
        },
      ));
      return;
    }

    bottomSheetOrderIsBuy = isBuy;
    Get.bottomSheet(EbookDetailBottomSheetOrderView());
  }

  void countPriceTotalOrder() {
    priceTotalOrder.value = (ebookMasterDetailModel.value!.harga.total);
  }
}
