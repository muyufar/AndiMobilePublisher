class EbookWishlistItem {
  final String idBarang;
  final String slugBarang;
  final String gambar1;
  final String judul;
  final int harga;
  final int diskon;

  EbookWishlistItem({
    required this.idBarang,
    required this.slugBarang,
    required this.gambar1,
    required this.judul,
    required this.harga,
    required this.diskon,
  });

  factory EbookWishlistItem.fromJson(Map<String, dynamic> json) {
    return EbookWishlistItem(
      idBarang: json['id_barang'],
      slugBarang: json['slug_barang'],
      gambar1: json['gambar1'],
      judul: json['judul'],
      harga: json['harga'],
      diskon: json['diskon'],
    );
  }
}

class WishlistResponse {
  final bool status;
  final String message;
  final List<EbookWishlistItem> data;
  final int total;

  WishlistResponse({
    required this.status,
    required this.message,
    required this.data,
    required this.total,
  });

  factory WishlistResponse.fromJson(Map<String, dynamic> json) {
    List<EbookWishlistItem> wishlistItems = (json['data'] as List)
        .map((wishlistJson) => EbookWishlistItem.fromJson(wishlistJson))
        .toList();

    return WishlistResponse(
      status: json['status'],
      message: json['message'],
      data: wishlistItems,
      total: json['total'],
    );
  }
}
