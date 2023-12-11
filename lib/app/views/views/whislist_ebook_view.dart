import 'package:andipublisher/app/data/models/ebook_whislist_model.dart';
import 'package:andipublisher/app/views/views/image_network_view.dart';
import 'package:andipublisher/extensions/int_extension.dart';
import 'package:andipublisher/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WhislistCardEbookView extends StatelessWidget {
  final EbookWishlistItem ebookItem;
  final VoidCallback onRemove;

  WhislistCardEbookView({
    required this.ebookItem,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(Routes.EBOOK_DETAIL, arguments: ebookItem.idBarang),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 0.70 / 1, // Adjust aspect ratio as needed
              child: Stack(
                children: [
                  ImageNetworkView(
                    url: ebookItem.gambar1,
                    fit: BoxFit.fill,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10),
                      ),
                    ),
                  ),
                 Align(
  alignment: Alignment.bottomRight, // Atur ke pojok kanan bawah
  child: GestureDetector(
    onTap: onRemove,
    child: Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9), // Warna latar belakang tombol
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0),
          topRight: Radius.circular(0),
          topLeft: Radius.circular(10),
        ),
      ),
      child: Icon(
        Icons.delete,
        size: 25, // Ukuran ikon sesuaikan kebutuhan Anda
        color: Colors.red, // Warna ikon
      ),
    ),
  ),
),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ebookItem.judul,
                    maxLines: 2,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    ebookItem.harga.parceRp(),
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
