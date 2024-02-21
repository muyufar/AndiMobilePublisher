import 'package:andipublisher/app/data/models/ebook_search_model.dart';
import 'package:andipublisher/app/views/views/image_network_view.dart';
import 'package:andipublisher/app/views/views/rating_product_view.dart';
import 'package:andipublisher/extensions/int_extension.dart';
import 'package:andipublisher/infrastructure/navigation/routes.dart';
import 'package:andipublisher/infrastructure/theme/theme_utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EbookCardSearchGridView extends GetView {
  final EbookSearchModel data;
  const EbookCardSearchGridView(this.data, {Key? key}) : super(key: key);

    @override
  Widget build(BuildContext context) {
    int hargaAwal = data.harga;
    int diskonAwal = data.diskon;
    double diskonAkhir = diskonAwal.toDouble();
    double diskonHarga = (diskonAkhir / 100.0) * hargaAwal;
    double hargatotal = hargaAwal - diskonHarga;
    String? jumlah = data.jumlah;
    // Hitung harga awal jika ada diskon

    // return Padding(padding: const EdgeInsets.symmetric(horizontal: 6))
    return InkWell(
      onTap: () => Get.toNamed(Routes.EBOOK_DETAIL, arguments: data.idBarang),
      child: AspectRatio(
          aspectRatio: 2 / 4.4,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                AspectRatio(
                    aspectRatio: 0.75 / 1,
                    child: Stack(
                      children: [
                        ImageNetworkView(
                          url: data.gambar1,
                          fit: BoxFit.fill,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(10))),
                        ),
                        // Diskon
                        Visibility(
                          visible: data.diskon != 0,
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              height: 30,
                              width: 40,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      // bottomRight: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  color: colorRad.withOpacity(0.9)),
                              child: Text(
                                '${data.diskon}%',
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),

                        // Stok Habis
                        Visibility(
                          visible: !data.statusStok,
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              height: 100,
                              width: 100,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black.withOpacity(0.8)),
                              child: const Text(
                                'Habis',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.judul,
                        maxLines: 2,
                        style: const TextStyle(fontSize: 12),
                      ),
                      // if (jumlah !=
                      //     0) // Periksa jika jumlah buku terjual tidak sama dengan 0
                      //   Text(
                      //     data.diskon != 0
                      //         ? data.harga.parceRp()
                      //         : '', // Hanya tampilkan harga awal jika diskon tidak 0
                      //     style: TextStyle(
                      //       fontSize: 10,
                      //       color: colorTextGrey,
                      //       decoration: TextDecoration.lineThrough,
                      //     ),
                      //   )
                      // else
                      //   const SizedBox
                      //       .shrink(), // Sembunyikan teks jika jumlah = 0
                      Text(
                        hargatotal.parceRp(),
                        style: const TextStyle(
                          fontSize:
                              12, // Sesuaikan ukuran font harga sesuai preferensi Anda
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 3),
                      if (jumlah !=
                          '0') // Periksa jika jumlah buku terjual tidak sama dengan 0
                        Text(
                          'Terjual: $jumlah',
                          style: const TextStyle(fontWeight: FontWeight.normal),
                        ),
                      const SizedBox(height: 5),
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              // You can set constraints for the container if needed
                              child: RatingProductView(
                                double.tryParse(data.rating) ?? 0.0,
                                starHalf: false,
                              ),
                            ),
                            // Other widgets or elements in the column
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}