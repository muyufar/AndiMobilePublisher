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

    final result = await MainService().getAPI(url: 'wishlist?idUser=$idUser');

    final wishlistData = result['data'] as List<dynamic>;
    final wishlistItems = wishlistData.map((data) => EbookWishlistItem.fromJson(data)).toList();

    return wishlistItems;
  }
}
