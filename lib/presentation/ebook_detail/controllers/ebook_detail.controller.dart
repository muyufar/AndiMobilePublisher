import 'package:andipublisher/app/controllers/utils_controller.dart';
import 'package:andipublisher/app/data/models/checkout_model.dart';
import 'package:andipublisher/app/data/models/ebook_master_detail_model.dart';
import 'package:andipublisher/app/data/models/item_master_detail_model.dart';
import 'package:andipublisher/app/data/services/cart_service.dart';
import 'package:andipublisher/app/data/services/ebook_services.dart';
import 'package:andipublisher/app/data/services/transaction_service.dart';
import 'package:andipublisher/app/views/views/dialog_view.dart';
import 'package:andipublisher/infrastructure/navigation/routes.dart';
import 'package:andipublisher/presentation/ebook_detail/views/ebook_detail_bottom_sheet_order.dart';
import 'package:andipublisher/presentation/transaction/views/transaction_send_view.dart';
import 'package:get/get.dart';

class EbookDetailController extends GetxController {
  final UtilsController utilsController = Get.put(UtilsController());

  Rxn<EbookMasterDetailModel> ebookMasterDetailModel =
      Rxn<EbookMasterDetailModel>();

  RxInt quantityOrder = 1.obs;
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
    quantityOrder.value = 1;
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
    CheckoutModel checkoutModel = await TransactionService.postCheckout(
        tag: 'direck',
        ids: [ebookMasterDetailModel.value!.idBarang],
        quantityOrderDireck: quantityOrder.value);

    Get.toNamed(Routes.CHECKOUT, arguments: checkoutModel);
  }

  Future<void> onTapAddCart() async {
    bool status = await CartService.postAddCart(
      idBarang: ebookMasterDetailModel.value!.idBarang,
      qty: quantityOrder.value,
      idCabang: '',
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
    priceTotalOrder.value =
        (ebookMasterDetailModel.value!.harga.total * quantityOrder.value);
  }
}
