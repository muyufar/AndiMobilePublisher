import 'package:andipublisher/app/views/views/future_view.dart';
import 'package:andipublisher/app/views/views/image_network_view.dart';
import 'package:andipublisher/extensions/date_time_extension.dart';
import 'package:andipublisher/extensions/int_extension.dart';
import 'package:andipublisher/infrastructure/theme/theme_utils.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/transaction_detail.controller.dart';

class TransactionDetailScreen extends GetView<TransactionDetailController> {
  const TransactionDetailScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(TransactionDetailController());

    return Scaffold(
        appBar: AppBar(
          title: const Text('Transaksi Detail'),
          centerTitle: true,
        ),
        body: FutureView(
          future: controller.fetchDetailTransaction(),
          widgetBuilder: Obx(
            () => Column(
              children: [
                Expanded(
                    child: ListView(
                  padding: EdgeInsets.symmetric(
                      horizontal: marginHorizontal, vertical: 10),
                  children: [
                    _transaction(),
                    _addressUser(),
                    _product(),
                    _send(),
                    _rincianPembayaran()
                  ],
                )),
                _buttom(
                    statusTransaction: controller.detailHistoryTransactionModel
                        .value!.transaksi.statusTransaksi),
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
              Text(controller.detailHistoryTransactionModel.value?.rincianHarga
                      .totalHargaSebelumDiskon
                      .parceRp() ??
                  '-'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Harga Ongkir'),
              Text(controller.detailHistoryTransactionModel.value?.rincianHarga
                      .hargaOngkir
                      .parceRp() ??
                  '-'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Voucher Barang'),
              Text(
                  '-${controller.detailHistoryTransactionModel.value?.rincianHarga.voucherHarga.parceRp()}'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Voucher Ongkir'),
              Text(
                  '-${controller.detailHistoryTransactionModel.value?.rincianHarga.voucherOngkir.parceRp()}'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Biaya Penanganan'),
              Text(controller.detailHistoryTransactionModel.value?.rincianHarga
                      .biayaPenanganan
                      .parceRp() ??
                  '-'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Total Harga'),
              Text(controller.detailHistoryTransactionModel.value?.rincianHarga
                      .totalHargaFinal
                      .parceRp() ??
                  '-'),
            ],
          ),
        ],
      ),
    );
  }

  Column _send() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Pengiriman',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Visibility(
          visible: (controller
                  .detailHistoryTransactionModel.value?.kurir.nomorResi !=
              '0'),
          child: Text(
              'No Resi : ${controller.detailHistoryTransactionModel.value?.kurir.nomorResi}'),
        ),
        Text(
            '${controller.detailHistoryTransactionModel.value?.kurir.kurirPengiriman} (${controller.detailHistoryTransactionModel.value?.kurir.kurirService})'),
        Text(
            'Total Berat ${controller.detailHistoryTransactionModel.value?.kurir.totalBerat}'),
        Text(
            'Catatan Pembelian : ${controller.detailHistoryTransactionModel.value?.kurir.catatanPembeli ?? '-'}-')
      ],
    );
  }

  ListView _product() {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 28),
        itemCount:
            controller.detailHistoryTransactionModel.value?.barang.length,
        itemBuilder: (context, index) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageNetworkView(
                  height: 80,
                  width: 80,
                  margin: const EdgeInsets.only(right: 10),
                  url: controller.detailHistoryTransactionModel.value
                          ?.barang[index].gambar1 ??
                      ''),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(controller.detailHistoryTransactionModel.value
                            ?.barang[index].judul ??
                        ''),
                    Text(
                        '${controller.detailHistoryTransactionModel.value?.barang[index].jumlahBeli}x'),
                    Text(
                        controller.detailHistoryTransactionModel.value!
                            .barang[index].hargaNormal
                            .parceRp(),
                        style: (controller.detailHistoryTransactionModel.value!
                                    .barang[index].diskon !=
                                0)
                            ? TextStyle(
                                color: colorGrey,
                                decoration: TextDecoration.lineThrough)
                            : null),
                    Visibility(
                        visible: (controller.detailHistoryTransactionModel
                                .value!.barang[index].diskon !=
                            0),
                        child: Text(
                          controller.detailHistoryTransactionModel.value!
                              .barang[index].hargaSetelahDiskon
                              .parceRp(),
                        ))
                  ],
                ),
              )
            ],
          );
        });
  }

  Column _addressUser() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Alamat',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
            '${controller.detailHistoryTransactionModel.value?.alamatUser.namaPenerima} | ${controller.detailHistoryTransactionModel.value?.alamatUser.teleponPenerima}'),
        Text(controller.detailHistoryTransactionModel.value?.alamatUser
                .alamatPengiriman ??
            ''),
        Text(
            '(${controller.detailHistoryTransactionModel.value?.alamatUser.labelAlamat})'),
      ],
    );
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
                controller.detailHistoryTransactionModel.value?.transaksi
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
                controller.detailHistoryTransactionModel.value?.transaksi
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
                    onPressed: () => controller.onTapPayNaw(),
                    child: const Text('Bayar Sekarang'),
                  ),
                )
              ],
            ),
          )
        : const SizedBox();
  }
}
