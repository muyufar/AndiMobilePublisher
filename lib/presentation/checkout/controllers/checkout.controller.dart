import 'package:andipublisher/app/data/models/checkout_model.dart';
import 'package:andipublisher/app/data/models/courier_model.dart';
import 'package:andipublisher/app/data/models/data_checkout_model.dart';
import 'package:andipublisher/app/data/models/payment_model.dart';
import 'package:andipublisher/app/data/services/courier_service.dart';
import 'package:andipublisher/app/data/services/transaction_service.dart';
import 'package:andipublisher/infrastructure/navigation/routes.dart';
import 'package:get/get.dart';

/// CheckoutController
///
/// This class is a controller for the checkout page.

/// Properties
///
/// * `checkoutModel`: The checkout model.
/// * `courierModel`: The list of courier models.
/// * `selectCourier`: The selected courier model.
/// * `selectAlamatUser`: The selected address user model.
/// * `hargaTotalProduct`: The total price of the products.
/// * `diskonTotalProduct`: The discount of the products.
/// * `ongkoskirim`: The shipping cost.
/// * `diskonOngkoskirim`: The discount of the shipping cost.
/// * `priceSubTotalItmes`: The list of subtotal prices of the items.

/// Methods
///
/// * `setPriceTotalItmes`: Sets the price total items.
/// * `weightTotalProductInWrehouse`: Calculates the total weight of the products in the warehouse.
/// * `fetchCourier`: Fetches the list of couriers.
/// * `onTapSelectCourier`: Handles the select courier button tap event.
/// * `onTapSelectPayment`: Handles the select payment button tap event.

/// Usage
///
/// To use this class, first you need to import it. Then, you can instantiate it like this:
///
///
/// CheckoutController controller = CheckoutController();
///
/// This code will instantiate a CheckoutController object.

class CheckoutController extends GetxController {
  CheckoutModel checkoutModel = Get.arguments;
  RxList<CourierModel> courierModel = RxList<CourierModel>();
  Rxn<CourierModel> selectCourier = Rxn<CourierModel>();
  Rxn<DataAlamatUser> selectAlamatUser = Rxn<DataAlamatUser>();
  RxInt hargaTotalProduct = 0.obs;
  RxInt diskonTotalProduct = 0.obs;
  RxInt ongkoskirim = 0.obs;
  RxInt diskonOngkoskirim = 0.obs;

  RxList<int> priceSubTotalItmes = <int>[].obs;

  @override
  void onInit() {
    selectAlamatUser.value = checkoutModel.dataUser.dataAlamatUser;
    setPriceTotalItmes();

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
    for (DataCheckout dataCheckout in checkoutModel.dataCheckout) {
      for (Item item in dataCheckout.items) {
        priceSubTotalItmes.add(item.subtotal);
      }
    }
  }

  int weightTotalProductInWrehouse({required int index}) {
    int weightTotalProduct = 0;

    for (var product in checkoutModel.dataCheckout[index].items) {
      weightTotalProduct += (product.berat * product.quantityOrder);
    }

    return weightTotalProduct;
  }

  Future<List<CourierModel>> fetchCourier({required int index}) async {
    courierModel.value = await CourierService.getCourier(
        idCabang: checkoutModel.dataCheckout[index].warehouseItem.idcabang,
        idAddressUser: checkoutModel.dataUser.dataAlamatUser.idAlamatUser,
        weight: weightTotalProductInWrehouse(index: index));
    return courierModel;
  }

  void onTapSelectCourier({required CourierModel data}) {
    selectCourier.value = data;
    ongkoskirim.value = selectCourier.value?.harga ?? 0;
    Get.back();
  }

  Future<void> onTapSelectPayment() async {
    //validator
    if (selectAlamatUser.value == null || selectCourier.value == null) {
      return;
    }

    List<DataCheckoutMolde> dataCheckout = [];

    for (var dataInCheckout in checkoutModel.dataCheckout) {
      List<Product> products = [];

      for (var product in checkoutModel.dataCheckout[0].items) {
        Product valueProduct = Product(
            idProduct: product.idBarang, quantity: product.quantityOrder);
        products.add(valueProduct);
      }

      DataCheckoutMolde valueDataCheckoutMolde = DataCheckoutMolde(
        idWarehouse: dataInCheckout.warehouseItem.idcabang,
        noteUserBuy: '',
        courier: Courier(
            courierService: selectCourier.value!.layanan,
            courierCode: selectCourier.value!.kode),
        products: products,
      );

      dataCheckout.add(valueDataCheckoutMolde);
    }

    PaymentModel result = await TransactionService.postPayment(
        idAddressUser: selectAlamatUser.value!.idAlamatUser,
        usePoinUser: false,
        dataCheckout: dataCheckout);

    Get.toNamed(Routes.PAYMENT, arguments: result);
  }
}
