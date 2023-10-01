import 'dart:convert';
import 'dart:developer';

import 'package:andipublisher/app/data/models/user_model.dart';
import 'package:andipublisher/app/data/services/cart_service.dart';
import 'package:andipublisher/app/views/views/dialog_view.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

/// UtilsController
///
/// This class is a controller for utility functions. It provides methods for checking the internet connection, saving and getting user data, and getting the cart count.

class UtilsController extends GetxController {
  //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

  /// Constructor
  ///
  ///
  /// UtilsController() {
  ///   isLogin = false.obs;
  ///   countCart = '0'.obs;
  /// }
  ///

  /// Properties
  ///
  /// * isLogin: A boolean that indicates whether the user is logged in.
  /// /// * userModel: The user model, which contains the user's data.
  /// /// * countCart: A string that contains the number of items in the cart.
  ///
  ///
  RxBool isLogin = false.obs;
  late  UserModel userModel;
  RxString countCart = '0'.obs;
  

  /// Methods
  ///
  /// * checkConnection(): This method checks the internet connection and shows a dialog if the connection is not available.
  /// * saveDataUser(userModel): This method saves the user data to the local storage.
  /// * getDataUser(): This method gets the user data from the local storage.
  /// * deleteDataUser(): This method deletes the user data from the local storage.
  /// * getCountCart(): This method gets the number of items in the cart from the api.

  /// Usage
  ///
  /// To use this class, you first need to instantiate it. Then, you can use the checkConnection(), saveDataUser(), getDataUser(), deleteDataUser(), and getCountCart() methods to perform the desired tasks.
  ///
  /// For example, the following code checks the internet connection and shows a dialog if the connection is not available:
  ///
  ///
  /// UtilsController utilsController = Get.put(UtilsController());
  /// utilsController.checkConnection();
  /// ```
  ///
  /// This code will show a dialog if the internet connection is not available.

  Future<void> checkConnection() async {
    final Connectivity connectivity = Connectivity();
    late ConnectivityResult result;
    late bool isConnectivity;

    Future<ConnectivityResult> getConnection() async {
      return await connectivity.checkConnectivity();
    }

    Future<bool> dialog() async {
      if (result == ConnectivityResult.none) {
        await Get.dialog(
          dialogView(
            title: 'Koneksi',
            content: 'Pastikan koneksi anda terhubung',
            onTapOke: () {
              Get.back();
            },
          ),
        );
        return false;
      } else {
        return true;
      }
    }

    do {
      result = await getConnection();
      isConnectivity = await dialog();
    } while (!isConnectivity);
  }

  void saveDataUser({required UserModel userModel}) {
    Map<String, dynamic> userMap = userModel.toMap();
    String json = jsonEncode(userMap);
    GetStorage().write('user', json);
  }

  void getDataUser() {
    String? user = GetStorage().read('user');
    if (user != null) {
      Map<String, dynamic> userMap = jsonDecode(user);
      userModel = UserModel.fromMap(userMap);
      log(user.toString());
      isLogin.value = userModel.idUser.isNotEmpty;
    }

    log('isLogin $isLogin');
  }

  void deleteDataUser() {
    GetStorage().remove('user');
    userModel = UserModel(
      idUser: '',
      namaUser: '',
      usernameUser: '',
      emailUser: '',
      teleponUser: '',
      fotoUser: '',
      poinUser: 0,
    );

    isLogin.value = userModel.idUser.isNotEmpty;

    log('isLogin $isLogin');
  }

void initializeUserModel() {
    userModel = UserModel(
      idUser: '',
      namaUser: '',
      usernameUser: '',
      emailUser: '',
      teleponUser: '',
      fotoUser: '',
      poinUser: 0,
    );
    // Set isLogin menjadi false saat userModel belum terinisialisasi
    isLogin.value = false;
  }
  Future<void> getCountCart() async {
    countCart.value = await CartService.getCartCount();
  }

   

}
