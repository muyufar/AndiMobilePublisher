import 'package:andipublisher/app/data/models/ebook_whislist_model.dart';
import 'package:andipublisher/app/data/services/main_service.dart';

class EbookWishlistService {
  static Future<bool> addWishlist({required String idUser, required String idEbook}) async {
    final Map<String, dynamic> body = {
      'idUser': idUser,
      'idEbook': idEbook,
    };

    final result = await MainService().postAPI(url: 'wishlist/set', body: body);
    return result['status'];
  }

  static Future<List<EbookWishlistItem>> getWishlist(String idUser) async {
    final Map<String, dynamic> body = {
      'idUser': idUser,
    };

    final result = await MainService().getAPI(url: 'wishlist?idUser=$idUser&offset=0&limit=10');

    final wishlistData = result['data']['list'] as List<dynamic>; // Ubah sesuai struktur data yang diterima
    final wishlistItems = wishlistData.map((data) => EbookWishlistItem.fromJson(data)).toList();

    return wishlistItems;
  }

    static Future<bool> removeWishlist({required String idUser, required String idEbook}) async {
    final Map<String, dynamic> body = {
      'idUser': idUser,
      'idEbook': idEbook,
    };

    final result = await MainService().postAPI(url: 'wishlist/set', body: body);
    return result['status'];
  }

 static Future<bool> isInWishlist({required String idUser, required String idEbook}) async {
    final result = await MainService().getAPI(url: 'wishlist?idUser=$idUser&offset=0&limit=10');

    final wishlistData = result['data']['list'] as List<dynamic>;

    // Periksa apakah eBook dengan slugBarang ada dalam Wishlist
    final existsInWishlist = wishlistData.any((data) {
      final ebook = data['id_barang'] as String;
      return ebook == idEbook;
    });

    return existsInWishlist;
  }
}
