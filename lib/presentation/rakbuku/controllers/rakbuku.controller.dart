import 'package:andipublisher/app/data/models/rakbuku_model.dart';
import 'package:andipublisher/app/data/services/rakbuku_service.dart';
import 'package:get/get.dart';

class RakBukuController extends GetxController {
  final RakBukuService _rakBukuService = RakBukuService();

  final rakBukuBeli = <RakBukuModel>[].obs;
  final rakBukuSewa = <RakBukuModel>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // Future<void> onRefresh() async {
  //   await getRakbuku();
  // }

  // Future<RakBukuModel> getRakbuku() async {
  //   rakBukuBeli.value =
  //       await RakBukuService.getRakbuku(String idUser, int tag);
  //   return RakBukuModel.value;
  // }

  void getRakbuku(String idUser, int tag) async {
    try {
      final _rakBukuService = await RakBukuService.getRakbuku(idUser, tag);
      if (tag == 1) {
        rakBukuBeli.assignAll(_rakBukuService as Iterable<RakBukuModel>);
      } else if (tag == 2) {
        rakBukuSewa.assignAll(_rakBukuService as Iterable<RakBukuModel>);
      }
    } catch (e) {
      // Handle error
      print('Error fetching rak buku: $e');
    }
  }
}



// class RakbukuController extends GetxController {
//   //TODO: Implement RakbukuController

//   final count = 0.obs;
//   @override
//   void onInit() {
//     super.onInit();
//   }

//   @override
//   void onReady() {
//     super.onReady();
//   }

//   @override
//   void onClose() {
//     super.onClose();
//   }

//   void increment() => count.value++;
// }
