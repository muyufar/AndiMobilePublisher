import 'dart:convert';

import 'package:andipublisher/app/data/models/rakbuku_model.dart';
import 'package:andipublisher/app/data/services/main_service.dart';

class RakBukuService {
  static Future<List<RakBukuModel>> getRakbuku(String idUser, int tag) async {
    final result =
        await MainService().getAPI(url: 'ebook/owned?idUser=$idUser&tag=$tag');
    final dataList = result['data'] as List<dynamic>;

    // Mengonversi List<dynamic> menjadi List<RakBukuModel>
    final rakBukuList =
        dataList.map((data) => RakBukuModel.fromJson(data)).toList();

    return rakBukuList;
  }
}

              
//     if (result.statusCode == 200) {
//       final Map<String, dynamic> data = json.decode(result.body);

//       final List<RakBukuModel> rakBukuList = [];
//       for (var rakData in data['data']) {
//         rakBukuList.add(RakBukuModel.fromJson(rakData));
//       }
//       return rakBukuList;
//       // return RakBukuModel.fromJson(result['data']);
//     } else {
//       throw Exception('Gagal mengambil data rak buku');
//     }
//   }
// }

//   final String baseUrl =
//       'https://api.andipublisher.com'; // Sesuaikan dengan URL API Anda

//   Future<List<RakBuku>> fetchRakBuku(String idUser, int tag) async {
//     final response = await http
//         .get(Uri.parse('$baseUrl/ebook/owned?idUser=$idUser&tag=$tag'));

//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       final List<RakBuku> rakBukuList = [];
//       for (var rakData in data['data']) {
//         rakBukuList.add(RakBuku.fromJson(rakData));
//       }
//       return rakBukuList;
//     } else {
//       throw Exception('Gagal mengambil data rak buku');
//     }
//   }
// }