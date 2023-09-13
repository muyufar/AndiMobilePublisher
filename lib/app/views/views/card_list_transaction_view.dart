import 'package:andipublisher/app/data/models/list_history_transaction_model.dart';
import 'package:andipublisher/app/views/views/image_network_view.dart';
import 'package:andipublisher/extensions/date_time_extension.dart';
import 'package:andipublisher/extensions/int_extension.dart';
import 'package:andipublisher/infrastructure/navigation/routes.dart';
import 'package:andipublisher/infrastructure/theme/theme_utils.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

/// CardListTransactionView
///
/// This class is a widget that displays a card of a history transaction.

/// Properties
///
/// * `data`: The history transaction data.

/// Usage
///
/// To use this class, first you need to import it. Then, you can use it to display a card of a history transaction like this:
///
///
/// CardListTransactionView(data: historyTransactionData);
///
/// This code will create a card of a history transaction with the data provided.

class CardListTransactionView extends GetView {
  final ListHistoryTransactionModel data;
  const CardListTransactionView({required this.data, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Get.toNamed(Routes.TRANSACTION_DETAIL, arguments: data.idTransaksi),
      child: Container(
        height: 120,
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: EdgeInsets.symmetric(horizontal: marginHorizontal),
        color: Colors.white,
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
                      url: data.barang.gambar1),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.barang.judul,
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
          ],
        ),
      ),
    );
  }
}
