import 'package:andipublisher/infrastructure/navigation/routes.dart';
import 'package:andipublisher/presentation/profile/controllers/profile.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class DeleteAccountView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hapus Akun'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Yakin ingin menghapus akun?',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Semua data akan dihapus secara permanen.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  child: Text('Batal'),
                  onPressed: () => Get.back(),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  child: Text('Hapus'),
                  onPressed: () async {
                    // Show loading indicator
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                            content: SizedBox(
                                height: 100,
                                child: Center(
                                    child: CircularProgressIndicator()))));

                    // Call delete account function
                    await controller.onTapDeleteAccount();

                    // Close loading indicator
                    Get.back();

                    // Show success message
                    Get.snackbar(
                      'Berhasil',
                      'Akun Anda berhasil dihapus.',
                      backgroundColor: Colors.green,
                      colorText: Colors.white,
                    );

                    // Logout and navigate to login screen
                    controller.onTapLogout();
                    Get.offAllNamed(Routes.LOGIN);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
