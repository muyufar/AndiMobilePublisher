import 'package:andipublisher/app/data/models/checkout_ebook_model.dart';
import 'package:andipublisher/app/data/models/data_ebook_checkout_model.dart';
import 'package:andipublisher/app/data/models/voucher_model.dart';
import 'package:andipublisher/app/views/views/image_network_view.dart';
import 'package:andipublisher/extensions/int_extension.dart';
import 'package:andipublisher/infrastructure/theme/theme_utils.dart';
import 'package:andipublisher/presentation/voucher_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:andipublisher/app/data/services/voucher_service.dart';
import 'package:andipublisher/presentation/checkout_ebook/controllers/checkout_ebook.controller.dart';

class CheckoutEbookScreen extends GetView<CheckoutEbookController> {
  const CheckoutEbookScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(CheckoutEbookController());

    return Scaffold(
        appBar: AppBar(
          title: const Text('Checkout Ebook'),
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Ionicons.chevron_back),
          ),
        ),
        body: ListView(
          children: [
            // _alamat(),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.checkoutEbookModel.dataEbookCheckout.length,
              itemBuilder: (context, index) => _dataItms(
                  data: controller.checkoutEbookModel.dataEbookCheckout[index],
                  index: index),
            ),
            //Voucher
            _voucher(),

            //Ringkasan Belanja
            _infoOrder(),

            //footer button
            _footer()
          ],
        ));
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
                  Obx(
                    () => Text(
                      ((controller.hargaTotalProduct.value +
                                  controller.checkoutEbookModel.dataProfile
                                      .biayaPenanganan) -
                              (controller.diskonTotalProduct.value))
                          .parceRp(),
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  )
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

  Container _infoOrder() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: marginHorizontal),
      color: Colors.white,
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ringkasan Belanja',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    'Total Harga (${controller.checkoutEbookModel.dataEbookCheckout.length} Barang)'),
                Text(controller.hargaTotalProduct.value.parceRp())
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total Diskon Barang'),
                Text('-${controller.diskonTotalProduct.value.parceRp()}')
              ],
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
                    'Pilih Voucher',
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

  Container _bottomSheetVoucher() {
    final TextEditingController codeController = TextEditingController();

    void fetchVoucherData() async {
      final String code = codeController.text;

      // Dapatkan idEbook dan idUser dari data eBook checkout
      final CheckoutEbookModel dataEbookCheckoutModel =
          Get.arguments as CheckoutEbookModel;

      final int idEbook = int.tryParse(
              dataEbookCheckoutModel.dataEbookCheckout[0].items[0].idBarang) ??
          0;

      final DataEbookCheckoutModel dataEbookCheckoutMode =
          Get.arguments as DataEbookCheckoutModel;
      final int idUser = int.tryParse(dataEbookCheckoutMode.user.idUser) ?? 0;

      final Voucher? result =
          await VoucherService.claimVoucher(code, idEbook, idUser);

      if (result != false) {
        // Tampilkan pesan berhasil atau aksi lainnya sesuai kebutuhan
        print('Voucher berhasil di-klaim!');
      } else {
        // Tampilkan pesan gagal atau aksi lainnya sesuai kebutuhan
        print('Voucher tidak valid.');
      }
    }

    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(top: 100),
      padding: EdgeInsets.only(
        bottom: 12,
        left: marginHorizontal,
        right: marginHorizontal,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Masukan Voucher',
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
            controller: codeController,
            decoration: InputDecoration(labelText: 'Code Voucher'),
          ),
          ElevatedButton(
            onPressed: fetchVoucherData,
            child: Text('Klaim Voucher'),
          ),
        ],
      ),
    );
  }

  // Container _alamat() {
  //   return Container(
  //     margin: const EdgeInsets.symmetric(vertical: 4),
  //     padding: EdgeInsets.symmetric(vertical: 4, horizontal: marginHorizontal),
  //     color: Colors.white,
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             const Text(
  //               'Alamat Pengiriman',
  //               style: TextStyle(fontWeight: FontWeight.bold),
  //             ),
  //             TextButton(
  //                 onPressed: () => Get.bottomSheet(_bottomSheetAddress(),
  //                     isScrollControlled: true),
  //                 child: const Text('Pilih Alamat Lain'))
  //           ],
  //         ),
  //         const Divider(),
  //         Text(
  //           controller.selectAlamatUser.value!.labelAlamatUser,
  //           style: const TextStyle(fontWeight: FontWeight.bold),
  //         ),
  //         Text(
  //           '${controller.selectAlamatUser.value!.namaPenerimaUser} (${controller.selectAlamatUser.value!.teleponUser})',
  //           style: const TextStyle(fontWeight: FontWeight.w200),
  //         ),
  //         Text(
  //           controller.selectAlamatUser.value!.alamatUser,
  //           style: const TextStyle(fontWeight: FontWeight.w200, fontSize: 12),
  //           maxLines: 2,
  //           overflow: TextOverflow.ellipsis,
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
