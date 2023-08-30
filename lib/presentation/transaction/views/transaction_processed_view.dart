import 'package:andipublisher/app/views/views/card_list_transaction_view.dart';
import 'package:andipublisher/app/views/views/future_view.dart';
import 'package:andipublisher/presentation/transaction/controllers/transaction.controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class TransactionProcessedView extends GetView {
  TransactionProcessedView({Key? key}) : super(key: key);

  @override
  final TransactionController controller = Get.put(TransactionController());

  @override
  Widget build(BuildContext context) {
    return FutureView(
      future: controller.getListProcessed(),
      widgetBuilder: Obx(
        () => ListView.builder(
            itemCount: controller.listProcessed.length,
            itemBuilder: (context, index) =>
                CardListTransactionView(data: controller.listProcessed[index])),
      ),
    );
  }
}
