import 'package:andipublisher/app/data/models/ebook_list_history_transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:andipublisher/infrastructure/navigation/routes.dart';


class CardEbookPrimaryRatingView extends GetView {
  final EbookListHistoryTransactionModel data;
  const CardEbookPrimaryRatingView({required this.data, Key? key})
      : super(key: key);

      @override
      Widget build(BuildContext context){
        return GestureDetector(
         onTap: () => Get.toNamed(Routes.EBOOK_PRIMARY_RATINGS_DETAIL_SCREEN,
          arguments: data.idTransaksi),
          child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        margin: const EdgeInsets.symmetric(vertical: 6),
        child: Column(
          children: [
            Row(
              children: [
                CachedNetworkImage(
                  imageUrl: data.barang[0].gambar1,
                  imageBuilder: (context, imageProvider) {
                    return Container(
                      height: 100,
                      width: 100,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 14),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                          // boxShadow: [
                          //   BoxShadow(
                          //       color: Colors.grey.shade300,
                          //       blurRadius: 4,
                          //       offset: const Offset(0, 2))
                          // ],
                          image: DecorationImage(image: imageProvider)),
                    );
                  },
                  errorWidget: (context, url, error) {
                    return Container(
                      height: 100,
                      width: 100,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 14),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 4,
                                offset: const Offset(0, 2))
                          ]),
                    );
                  },
                  placeholder: (context, url) {
                    return Container(
                      height: 100,
                      width: 100,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 14),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 4,
                                offset: const Offset(0, 2))
                          ]),
                    );
                  },
                ),
                SizedBox(
                  height: 100,
                  width: Get.width - (140),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        data.statusTransaksi,
                        style: const TextStyle(
                            fontSize: 16, color: Colors.redAccent),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          data.barang[0].judul,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      // Text(
                      //   data.barang[0].subTotal,
                      //   style: const TextStyle(fontSize: 16),
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const SizedBox(width: 8),
                          // Text(
                          //   data.totalHargaFinal,
                          //   style: const TextStyle(
                          //       fontSize: 16, color: Colors.redAccent),
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                const Text('Produk'),
                const Spacer(flex: 4),
                const Text(
                  'Total Pesanan : ',
                  style: TextStyle(color: Colors.grey),
                ),
                const Spacer(),
                // Text(
                //   data.totalHargaFinal,
                //   style: const TextStyle(fontSize: 16, color: Colors.redAccent),
                // ),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Get.width / 2,
                      // child: Text(
                      //   'Nilai Produk sebelum ${data.}',
                      //   style: const TextStyle(color: Colors.grey),
                      // ),
                    ),
                  ],
                ),
                ElevatedButton(
                    onPressed: () => Get.toNamed(
                        Routes.EBOOK_PRIMARY_RATINGS_DETAIL_SCREEN,
                        arguments: data.idTransaksi),
                    style:
                        ElevatedButton.styleFrom(shape: const StadiumBorder()),
                    child: const Text('   Nilai   ')),
              ],
            )
          ],
        ),
      ),
        );
      }
}
