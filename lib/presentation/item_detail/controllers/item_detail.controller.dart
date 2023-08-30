import 'package:andipublisher/app/controllers/utils_controller.dart';
import 'package:andipublisher/app/data/models/checkout_model.dart';
import 'package:andipublisher/app/data/models/item_master_detail_model.dart';
import 'package:andipublisher/app/data/services/cart_service.dart';
import 'package:andipublisher/app/data/services/items_service.dart';
import 'package:andipublisher/app/data/services/transaction_service.dart';
import 'package:andipublisher/app/views/views/dialog_view.dart';
import 'package:andipublisher/infrastructure/navigation/routes.dart';
import 'package:andipublisher/presentation/item_detail/views/item_detail_bottom_sheet_order.dart';
import 'package:get/get.dart';

class ItemDetailController extends GetxController {
  final UtilsController utilsController = Get.put(UtilsController());

  Rxn<ItemMasterDetailModel> itemMasterDetailModel =
      Rxn<ItemMasterDetailModel>();
  Rxn<Warehouse> warehouse = Rxn<Warehouse>();

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

  Future<ItemMasterDetailModel> fetchDetailItem() async {
    itemMasterDetailModel.value =
        await ItemsService.getItemMasterDetail(id: Get.arguments);

    countPriceTotalOrder();

    warehouse.value = itemMasterDetailModel.value?.warehouse[0];

    return itemMasterDetailModel.value!;
  }

  Future<void> onTapBuyNow() async {
    //Menutup bottomSheetOrder
    Get.back();

    //send api
    CheckoutModel checkoutModel = await TransactionService.postCheckout(
        tag: 'direck',
        ids: [itemMasterDetailModel.value!.idBarang],
        idCabang: warehouse.value!.idcabang,
        quantityOrderDireck: quantityOrder.value);

    Get.toNamed(Routes.CHECKOUT, arguments: checkoutModel);
  }

  Future<void> onTapAddCart() async {
    bool status = await CartService.postAddCart(
      idBarang: itemMasterDetailModel.value!.idBarang,
      idCabang: warehouse.value!.idcabang,
      qty: quantityOrder.value,
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
    Get.bottomSheet(ItemDetailBottomSheetOrderView());
  }

  void onTapQuantityMinus() {
    quantityOrder--;
    countPriceTotalOrder();
  }

  void onTapQuantityPlus() {
    quantityOrder++;
    countPriceTotalOrder();
  }

  void countPriceTotalOrder() {
    priceTotalOrder.value =
        (itemMasterDetailModel.value!.hargaPromo * quantityOrder.value);
  }

  void onChangedDropdown(Warehouse? val) {
    warehouse.value = val;
    quantityOrder.value = 1;
    countPriceTotalOrder();
  }
}
