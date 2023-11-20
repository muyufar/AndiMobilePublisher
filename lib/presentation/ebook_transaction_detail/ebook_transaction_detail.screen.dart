import 'package:andipublisher/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:andipublisher/app/views/views/future_view.dart';
import 'package:get/get.dart';
import 'package:andipublisher/app/views/views/image_network_view.dart';
import 'package:andipublisher/extensions/date_time_extension.dart';
import 'package:andipublisher/extensions/int_extension.dart';
import 'package:andipublisher/infrastructure/theme/theme_utils.dart';
import 'controllers/ebook_transaction_detail.controller.dart';

class EbookTransactionDetailScreen
    extends GetView<EbookTransactionDetailController> {
  const EbookTransactionDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(EbookTransactionDetailController());

    return Scaffold(
        appBar: AppBar(
          title: const Text('Ebook Transaksi Detail'),
          centerTitle: true,
        ),
        body: FutureView(
          future: controller.ebookfetchDetailTransaction(),
          widgetBuilder: Obx(
            () => Column(
              children: [
                Expanded(
                    child: ListView(
                  padding: EdgeInsets.symmetric(
                      horizontal: marginHorizontal, vertical: 10),
                  children: [_transaction(), _product(), _rincianPembayaran()],
                )),
                _buttom(
                    statusTransaction: controller
                        .ebookdetailHistoryTransactionModel
                        .value!
                        .transaksi
                        .statusTransaksi),
                _buttomreview(),
              ],
            ),
          ),
        ));
  }

  Container _rincianPembayaran() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: EdgeInsets.symmetric(horizontal: marginHorizontal, vertical: 8),
      decoration:
          BoxDecoration(color: Colors.white, borderRadius: borderRadius),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Rincian pembayaran',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Total Barang'),
              Text(controller.ebookdetailHistoryTransactionModel.value
                      ?.rincianHarga.totalHargaSebelumDiskon
                      .parceRp() ??
                  '-'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Biaya Penanganan'),
              Text(controller.ebookdetailHistoryTransactionModel.value
                      ?.rincianHarga.biayaPenaganan
                      .parceRp() ??
                  '-'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Potongan Voucher'),
              Text(
                  '-${controller.ebookdetailHistoryTransactionModel.value?.rincianHarga.voucherHarga.parceRp()}'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Total Harga'),
              Text(controller.ebookdetailHistoryTransactionModel.value
                      ?.rincianHarga.totalHargaFinal
                      .parceRp() ??
                  '-'),
            ],
          ),
        ],
      ),
    );
  }

  ListView _product() {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 28),
        itemCount:
            controller.ebookdetailHistoryTransactionModel.value?.items.length,
        itemBuilder: (context, index) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageNetworkView(
                  height: 80,
                  width: 80,
                  margin: const EdgeInsets.only(right: 10),
                  url: controller.ebookdetailHistoryTransactionModel.value
                          ?.items[index].gambar1 ??
                      ''),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(controller.ebookdetailHistoryTransactionModel.value
                            ?.items[index].judul ??
                        ''),
                    Text(
                        controller.ebookdetailHistoryTransactionModel.value!
                            .items[index].hargaNormal
                            .parceRp(),
                        style: (controller.ebookdetailHistoryTransactionModel
                                    .value!.items[index].diskon !=
                                0)
                            ? TextStyle(
                                color: colorGrey,
                                decoration: TextDecoration.lineThrough)
                            : null),
                    Visibility(
                        visible: (controller.ebookdetailHistoryTransactionModel
                                .value!.items[index].diskon !=
                            0),
                        child: Text(
                          controller.ebookdetailHistoryTransactionModel.value!
                              .items[index].hargaSetelahDiskon
                              .parceRp(),
                        ))
                  ],
                ),
              )
            ],
          );
        });
  }

  Container _transaction() {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.symmetric(horizontal: marginHorizontal, vertical: 8),
      decoration: BoxDecoration(
          color: colorPrimary.withOpacity(0.6), borderRadius: borderRadius),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Invoice',
                style: TextStyle(color: colorTextWhite),
              ),
              Text(
                controller.ebookdetailHistoryTransactionModel.value?.transaksi
                        .idInvoice ??
                    '',
                style: TextStyle(color: colorTextWhite),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tanggal Transaksi',
                style: TextStyle(color: colorTextWhite),
              ),
              Text(
                controller.ebookdetailHistoryTransactionModel.value?.transaksi
                        .tanggalTransaksi
                        .toCustomFormat() ??
                    '',
                style: TextStyle(color: colorTextWhite),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buttom({required String statusTransaction}) {
    return (statusTransaction == '1')
        ? Container(
            padding: EdgeInsets.symmetric(horizontal: marginHorizontal),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(color: colorGrey))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: Get.width - 50,
                  child: ElevatedButton(
                    onPressed: () => controller.onTapPayNow(),
                    child: const Text('Bayar Sekarang'),
                  ),
                )
              ],
            ),
          )
        : const SizedBox();
  }

Widget _buttomreview() {
  return Visibility(
    visible: (controller.ebookdetailHistoryTransactionModel.value?.transaksi.statusTransaksi == '5'),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: marginHorizontal),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: colorGrey)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: Get.width - 50,
            child: ElevatedButton(
              onPressed: () => Get.toNamed(Routes.EBOOK_RATINGS,
              arguments: controller.ebookdetailHistoryTransactionModel.value?.transaksi.idTransaksi), // Ganti dengan rute ke EbookRatingsScreen
              child: const Text('Beri Penilaian'),
            ),
          )
        ],
      ),
    ),
  );
}


}
