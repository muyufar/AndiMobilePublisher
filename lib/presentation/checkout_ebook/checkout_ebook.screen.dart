import 'dart:convert';

import 'package:andipublisher/app/data/models/checkout_ebook_model.dart';
import 'package:andipublisher/app/data/services/main_service.dart';
import 'package:andipublisher/app/data/services/transaction_ebook_service.dart';
import 'package:andipublisher/app/views/views/image_network_view.dart';
import 'package:andipublisher/extensions/int_extension.dart';
import 'package:andipublisher/infrastructure/theme/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:andipublisher/presentation/checkout_ebook/controllers/checkout_ebook.controller.dart';

class CheckoutEbookScreen extends GetView<CheckoutEbookController> {
  const CheckoutEbookScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout Ebook'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Ionicons.chevron_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Obx(
          () {
            return Column(
              children: [
                // _alamat(),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount:
                      controller.checkoutEbookModel.dataEbookCheckout.length,
                  itemBuilder: (context, index) => _dataItms(
                      data: controller
                          .checkoutEbookModel.dataEbookCheckout[index],
                      index: index),
                ),
                //Voucher
                _voucher(),

                //Ringkasan Belanja
                _infoOrder(),

                //footer button
                _footer()
              ],
            );
          },
        ),
      ),
    );
  }

  Container _footer() {
    return Container(
      margin: const EdgeInsets.only(top: 4),
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: marginHorizontal),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //text pernyataan
          const Text('Saya menyetujui pembayaran ini',
              style: TextStyle(fontSize: 10)),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //total belanaja
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Total Belanja',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  // Text(
                  //   _calculateTotalBelanja(),
                  //   style: const TextStyle(
                  //       fontSize: 16, fontWeight: FontWeight.bold),
                  // ),
                  Obx(
                    () => Text(
                      controller.totalHarga.value.parceRp(),
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),

              //button Pilih Pembayaran
              SizedBox(
                width: Get.width / 2,
                child: ElevatedButton(
                    onPressed: () => controller.onTapSelectPayment(),
                    child: const Text('Pilih Pembayaran')),
              )
            ],
          )
        ],
      ),
    );
  }

  // String _calculateTotalBelanja() {

  //   return totalHarga.parceRp();
  // }

  Container _infoOrder() {
    controller.totalHarga.value = controller.checkoutEbookModel.subtotal.total;
    // controller.checkoutEbookModel.subtotal.diskon.voucher = 0;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: marginHorizontal),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Ringkasan Belanja',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total Harga'),
              Text(controller.checkoutEbookModel.subtotal.harga.parceRp())
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Total Diskon Barang'),
              Text(
                  '-${controller.checkoutEbookModel.subtotal.diskon.barang.parceRp()}')
            ],
          ),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total Diskon Voucher'),
                Text('-${controller.voucher.value.parceRp()}'),
              ],
            ),
          ),

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     const Text('Total Ongkos Kirim'),
          //     Text(controller.ongkoskirim.value.parceRp())
          //   ],
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     const Text('Total Diskon Ongkos Kirim'),
          //     Text('-${controller.diskonOngkoskirim.value.parceRp()}')
          //   ],
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Biaya Penanganan'),
              Text(controller.checkoutEbookModel.dataProfile.biayaPenanganan
                  .parceRp())
            ],
          ),
        ],
      ),
    );
  }

  Container _voucher() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: marginHorizontal),
      color: Colors.white,
      child: Column(
        children: [
          InkWell(
            onTap: () => Get.bottomSheet(_bottomSheetVoucher(),
                isScrollControlled: true),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 4),
              padding: EdgeInsets.symmetric(
                  vertical: 14, horizontal: marginHorizontal),
              decoration: BoxDecoration(
                  borderRadius: borderRadius,
                  border: Border.all(color: colorGrey)),
              child: Row(
                children: [
                  const Icon(Ionicons.ticket_outline),
                  SizedBox(width: marginHorizontal),
                  const Text(
                    'Masukan Voucher',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Icon(
                    Ionicons.chevron_forward,
                    size: 18,
                    color: colorGrey,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _dataItms({required DataEbookCheckout data, required int index}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: marginHorizontal),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //warehouse
          // Text(
          //   // data.warehouseItem.namaCabang,
          //   style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          // ),
          //items
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: data.items.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    //image item
                    Container(
                      width: 100,
                      margin: const EdgeInsets.only(right: 8),
                      child: AspectRatio(
                        aspectRatio: 1 / 1,
                        child: ImageNetworkView(url: data.items[index].gambar1),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //title item
                        SizedBox(
                          width: Get.width - 168,
                          child: Text(
                            data.items[index].judul,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),

                        //berat
                        // Text(
                        //   'Berat ${data.items[index].berat * data.items[index].quantityOrder} g',
                        //   style: TextStyle(fontSize: 12, color: colorTextGrey),
                        // ),

                        //harga harga promo
                        Row(
                          children: [
                            Text(
                              (data.items[index].hargaPromo).parceRp(),
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Visibility(
                              visible: (data.items[index].diskon != 0),
                              child: Text(
                                (data.items[index].harga).parceRp(),
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    color: colorTextGrey),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(width: 6),
                    //quantityOrder
                    // Text(
                    //   '${data.items[index].quantityOrder}X',
                    //   style: TextStyle(
                    //       fontSize: 16,
                    //       color: colorTextPrimary,
                    //       fontWeight: FontWeight.bold),
                    // )
                  ],
                ),
              );
            },
          ),
          const Divider(),
          //Pilih Pengiriman
          // InkWell(
          //   onTap: () async {
          //     await controller.fetchCourier(index: index);
          //     if (controller.courierModel.isEmpty) {
          //       return;
          //     }
          //     Get.bottomSheet(_bottomSheetCourier(), isScrollControlled: true);
          //   },
          //   child: Container(
          //       margin: const EdgeInsets.symmetric(vertical: 4),
          //       padding: EdgeInsets.symmetric(
          //           vertical: 14, horizontal: marginHorizontal),
          //       decoration: BoxDecoration(
          //           borderRadius: borderRadius,
          //           border: Border.all(color: colorGrey)),
          //       child: Obx(
          //         () => (controller.selectCourier.value?.kode == null)
          //             ? Row(
          //                 children: [
          //                   const Icon(Ionicons.archive_outline),
          //                   SizedBox(width: marginHorizontal),
          //                   const Text(
          //                     'Pilih Pengiriman',
          //                     style: TextStyle(fontWeight: FontWeight.bold),
          //                   ),
          //                   const Spacer(),
          //                   Icon(
          //                     Ionicons.chevron_forward,
          //                     size: 18,
          //                     color: colorGrey,
          //                   )
          //                 ],
          //               )
          //             : Row(
          //                 children: [
          //                   Column(
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: [
          //                       Text(
          //                         '${controller.selectCourier.value?.layanan} ${controller.selectCourier.value?.produk} (${controller.selectCourier.value?.harga.parceRp()})',
          //                         style: const TextStyle(
          //                             fontWeight: FontWeight.bold),
          //                       ),
          //                       Text(
          //                           'Estimasi ${controller.selectCourier.value?.estimasi} hari')
          //                     ],
          //                   ),
          //                   const Spacer(),
          //                   Icon(
          //                     Ionicons.chevron_forward,
          //                     size: 18,
          //                     color: colorGrey,
          //                   )
          //                 ],
          //               ),
          //       )),
          // ),
          //subtotal
          // ExpansionTile(
          //   childrenPadding: EdgeInsets.symmetric(horizontal: marginHorizontal),
          //   expandedAlignment: Alignment.topLeft,
          //   expandedCrossAxisAlignment: CrossAxisAlignment.start,
          //   title: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       const Text('Subtotal'),
          //       Text(
          //         (data.items.fold(0, (total, item) => total + item.subtotal))
          //             .parceRp(),
          //         style: const TextStyle(fontWeight: FontWeight.bold),
          //       ),
          //     ],
          //   ),
          //   children: [
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         Text('Harga (${data.items.length} Barang)'),
          //         Text(data.items
          //             .fold(0, (total, item) => total + item.subtotal)
          //             .parceRp()),
          //       ],
          //     ),
          //     // Row(
          //     //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     //   children: [
          //     //     const Text('Total Ongkos Kirim'),
          //     //     Text(
          //     //       controller.ongkoskirim.value.parceRp(),
          //     //     ),
          //     //   ],
          //     // ),
          //   ],
          // ),
        ],
      ),
    );
  }

  // Container _bottomSheetCourier() {
  //   return Container(
  //     color: Colors.white,
  //     margin: const EdgeInsets.only(top: 100),
  //     padding: EdgeInsets.only(
  //         bottom: 12, left: marginHorizontal, right: marginHorizontal),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.stretch,
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             const Text(
  //               'Pilih Pengiriman',
  //               style: TextStyle(fontWeight: FontWeight.bold),
  //             ),
  //             IconButton(
  //               onPressed: () => Get.back(),
  //               icon: Icon(
  //                 Ionicons.close_outline,
  //                 color: colorBlack,
  //               ),
  //             ),
  //           ],
  //         ),
  //         ListView.builder(
  //           shrinkWrap: true,
  //           itemCount: controller.courierModel.length,
  //           itemBuilder: (context, index) {
  //             return ListTile(
  //               titleTextStyle: TextStyle(fontSize: 14, color: colorBlack),
  //               selected: controller.courierModel[index].kode ==
  //                   controller.selectCourier.value?.kode,
  //               onTap: () => controller.onTapSelectCourier(
  //                   data: controller.courierModel[index]),
  //               title: Text(
  //                   '${controller.courierModel[index].layanan} ${controller.courierModel[index].produk} (${controller.courierModel[index].harga.parceRp()})'),
  //               subtitle: Text(
  //                   'Estimasi ${controller.courierModel[index].estimasi} hari'),
  //             );
  //           },
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Container _bottomSheetAddress() {
  //   return Container(
  //     color: Colors.white,
  //     margin: const EdgeInsets.only(top: 100),
  //     padding: EdgeInsets.only(
  //         bottom: 12, left: marginHorizontal, right: marginHorizontal),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.stretch,
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             const Text(
  //               'Pilih Alamat',
  //               style: TextStyle(fontWeight: FontWeight.bold),
  //             ),
  //             IconButton(
  //               onPressed: () => Get.back(),
  //               icon: Icon(
  //                 Ionicons.close_outline,
  //                 color: colorBlack,
  //               ),
  //             ),
  //           ],
  //         ),
  //         ListView(
  //           shrinkWrap: true,
  //           children: [],
  //         ),
  //         TextButton(onPressed: () {}, child: const Text('Tambah Alamat'))
  //       ],
  //     ),
  //   );
  // }

  // Container _bottomSheetVoucher() {
  //   final TextEditingController codeController = TextEditingController();
  //   fetchVoucherData(String code) async {
  //     final CheckoutEbookModel dataEbookCheckoutModel = Get.arguments;

  //     final int idEbook = int.tryParse(
  //             dataEbookCheckoutModel.dataEbookCheckout[0].items[0].idBarang) ??
  //         0;

  //     final DataEbookCheckoutModel dataEbookCheckoutMode = Get.arguments;
  //     final int idUser = int.tryParse(dataEbookCheckoutMode.user.idUser) ?? 0;

  //     final bool isVoucherValid =
  //         (await VoucherService.claimVoucher(code, idEbook, idUser)) as bool;

  // if (isVoucherValid) {
  //   // Perbarui voucherCode dalam objek CheckoutEbookModel
  //   controller.updateVoucherCode(true);

  //   // Perbarui total harga berdasarkan nilai diskon voucher
  //   controller.updateTotalPriceWithVoucher(dataEbookCheckoutModel.subtotal.harga);

  //   // Tampilkan pesan berhasil atau aksi lainnya sesuai kebutuhan
  //   print('Voucher berhasil di-klaim!');
  // } else {
  //   // Tampilkan pesan gagal atau aksi lainnya sesuai kebutuhan
  //   print('Voucher tidak valid.');

  //   // Perbarui voucherCode dalam objek CheckoutEbookModel
  //   controller.updateVoucherCode(false);
  // }

  Container _bottomSheetVoucher() {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(top: 100),
      padding: EdgeInsets.only(
          bottom: 12, left: marginHorizontal, right: marginHorizontal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Pilih Voucher',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Ionicons.close_outline,
                  color: colorBlack,
                ),
              ),
            ],
          ),
          TextField(
            controller: controller.textVoucher,
          ),
          ElevatedButton(
            onPressed: () {
              var voucher = controller.textVoucher.text;

              print("DATA_VOUCHER: $voucher");

              List<String> produk = [];
              for (int i = 0;
                  i < controller.checkoutEbookModel.dataEbookCheckout.length;
                  i++) {
                produk.add(controller
                    .checkoutEbookModel.dataEbookCheckout[i].items[i].idBarang);
              }

              TransactionEbookService.postCheckout(
                tag: "direck",
                ids: produk,
                voucherCode: voucher,
              ).then((value) {
                print("DATA_RESULT: $value");

                CheckoutEbookModel checkoutEbook = value;

                print("RESULT: ${checkoutEbook.subtotal.diskon.voucher}");

                controller.voucher.value =
                    checkoutEbook.subtotal.diskon.voucher;
                controller.totalHarga.value = checkoutEbook.subtotal.total;

                Get.back();
              }).catchError((Object e) {
                print("DATA_ERROR: $e");
              });
            },
            child: Text("Claim"),
          ),
        ],
      ),
    );
  }
}
