import 'package:andipublisher/app/controllers/utils_controller.dart';
import 'package:andipublisher/app/data/models/user_model.dart';
import 'package:andipublisher/app/data/services/user_service.dart';
import 'package:andipublisher/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final UtilsController utilsController = Get.put(UtilsController());
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  // UserModel userModel = UserModel();
  @override
  void onInit() {
    // userModel = fetchUserModel();
    utilsController.initializeUserModel();
   
    super.onInit();
  }

  @override
  void onReady() {
    utilsController.getDataUser();
    // scaffoldKey = GlobalKey<ScaffoldState>();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onTapLogout() {
    utilsController.deleteDataUser();
    if (!utilsController.isLogin.value) {
      Get.toNamed(Routes.LOGIN);
    }
  }

  Future<void> onTapDeleteAccount() async {
  // Get user ID from user model
  String userId = utilsController.userModel.idUser;

  // Show loading indicator
  Get.dialog(AlertDialog(
    content: Row(
      children: [
        CircularProgressIndicator(),
        SizedBox(width: 10),
        Text('Menghapus akun...'),
      ],
    ),
  ));

  // Call delete account service
  try {
    await UserService.deleteakun(idUser: userId);

    // Close loading indicator and show success message
    Get.back();
    Get.snackbar(
      'Berhasil',
      'Akun Anda berhasil dihapus.',
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );

    // Logout by deleting user data and navigate to login screen
    utilsController.deleteDataUser();
    Get.offAllNamed(Routes.LOGIN);
  } catch (error) {
    // Close loading indicator and show error message
    Get.back();
    Get.snackbar(
      'Gagal',
      'Terjadi kesalahan saat menghapus akun. Coba lagi nanti.',
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }
}


}