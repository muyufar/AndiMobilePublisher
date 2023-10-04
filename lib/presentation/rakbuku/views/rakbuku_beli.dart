import 'package:andipublisher/gen/assets.gen.dart';
import 'package:andipublisher/presentation/rakbuku/controllers/rakbuku.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:andipublisher/app/data/models/rakbuku_model.dart';
import 'package:andipublisher/app/controllers/utils_controller.dart';
import 'package:andipublisher/app/views/views/rakbuku_view.dart';
import 'package:lottie/lottie.dart';

class RakBukuBeliScreen extends StatelessWidget {
  final RakBukuController rakBukuController = Get.put(RakBukuController());
  final UtilsController utilsController = Get.put(UtilsController()); // Mengambil UtilsController

  RakBukuBeliScreen() {
    //final idUser = utilsController.userModel.idUser; // Mendapatkan idUser dari UtilsController
    rakBukuController.getRakbuku(1); // Menggunakan idUser dalam pemanggilan getRakbuku
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          if (rakBukuController.isLoading.value) {
            // Tampilkan indikator loading jika data masih dimuat
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return _buildRakBukuList();
          }
        },
      ),
    );
  }

Widget _buildRakBukuList() {
  if (!rakBukuController.utilsController.isLogin.value || rakBukuController.isLoading.value) {
    // Jika pengguna belum login atau data masih dimuat, tampilkan loading indicator
    return Center(
      child: CircularProgressIndicator(),
    );
  } else if (rakBukuController.rakBukuBeli.isEmpty) {
    // Jika pengguna sudah login dan data telah dimuat, tetapi tidak ada data
    return Center(
      
      child: Column(
        
        mainAxisAlignment: MainAxisAlignment.center,
       
        children: [
          // SizedBox(height: 10),
          Lottie.asset(Assets.lottie.emptyStatePage, width: 200, height: 200),
          Text('Belum ada Ebook di Rak Buku'),
        ],
      ),
    );
  } else {
    // Jika pengguna sudah login, data sudah dimuat, dan ada data yang ditampilkan
    return SingleChildScrollView(
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 1 / 1,
          mainAxisExtent: Get.height / 2.6,
          mainAxisSpacing: 0,
        ),
        itemCount: rakBukuController.rakBukuBeli.length,
        itemBuilder: (context, index) {
          final rakBuku = rakBukuController.rakBukuBeli[index];
          return RakBukuView(rakBuku);
        },
      ),
    );
  }
}


}