import 'package:andipublisher/app/data/models/ebook_list_history_transaction_model.dart';
import 'package:andipublisher/app/views/views/image_network_view.dart';
import 'package:andipublisher/extensions/date_time_extension.dart';
import 'package:andipublisher/extensions/int_extension.dart';
import 'package:andipublisher/infrastructure/theme/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:andipublisher/infrastructure/navigation/routes.dart';

class CardEbookPrimaryRatingView extends GetView {
  final EbookListHistoryTransactionModel data;
  const CardEbookPrimaryRatingView({required this.data, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Get.toNamed(Routes.EBOOK_RATINGS_DETAIL, arguments: data.idTransaksi),
      child: Container(
        height: 145,
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: marginHorizontal),
        margin: EdgeInsets.symmetric(vertical: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Tanggal ${data.tanggalTransaksi.toCustomFormat()}',
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: colorTextGrey,
                  fontSize: 12),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImageNetworkView(
                      height: 80,
                      width: 80,
                      margin: const EdgeInsets.only(right: 8),
                      url: data.barang[0].gambar1),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.barang[0].judul,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(data.jumlahBarang),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Total Harga'),
                            Text(
                              data.totalHargaFinal.parceRp(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: colorTextPrimary),
                            ),
                          ],
                        ),
                        const Spacer(),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Get.width / 2,
                      child: Text(
                        'Nilai Produk sebelum ',
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () => Get.toNamed(
                    Routes.EBOOK_RATINGS_DETAIL,
                    arguments: data.idTransaksi,
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: colorPrimary,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                    // fixedSize: Size.fromHeight(
                    //     25), // Sesuaikan tinggi sesuai keinginan Anda
                  ),
                  child: const Text('  Beri  Nilai   '),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
