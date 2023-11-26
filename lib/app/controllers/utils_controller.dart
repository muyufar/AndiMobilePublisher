import 'dart:convert';
import 'dart:developer';

import 'package:andipublisher/app/data/models/user_model.dart';
import 'package:andipublisher/app/data/services/cart_service.dart';
import 'package:andipublisher/app/views/views/dialog_view.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';

class GlobalKeyManager {
  static final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  static final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  static final GlobalKey<ScaffoldState> mainScaffoldKey =
      GlobalKey<ScaffoldState>();
}

class UtilsController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKeyManager.loginFormKey;
  final GlobalKey<FormState> registerFormKey = GlobalKeyManager.registerFormKey;
  final GlobalKey<ScaffoldState> mainScaffoldKey =
      GlobalKeyManager.mainScaffoldKey;

  RxBool isLogin = false.obs;
  late UserModel userModel;
  RxString countCart = '0'.obs;

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
    isLogin.value = false;
  }

  Future<void> getCountCart() async {
    countCart.value = await CartService.getCartCount();
  }

   void onTapChatWa() {
    launchUrl(Uri.parse('https://api.whatsapp.com/send?phone=628112936865'),
        mode: LaunchMode.externalApplication);
  }
}
