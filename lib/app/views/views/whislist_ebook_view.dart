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
              aspectRatio: 2.1 / 1.6, // Adjust aspect ratio as needed
              child: Stack(
                children: [
                  ImageNetworkView(
                    url: ebookItem.gambar1,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10),
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
                     maxLines: 3,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    ebookItem.harga.parceRp(),
                    style: TextStyle(fontSize: 19),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: EdgeInsets.all(8), // Adjust margin as needed
                      child: IconButton(
                        icon: Icon(
                          Icons.delete,
                          size: 32, // Increase icon size as needed
                          color: Colors.black, // Change icon color to black
                        ),
                        onPressed: onRemove,
                      ),
                    ),
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
