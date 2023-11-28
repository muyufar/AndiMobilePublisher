import 'package:andipublisher/app/views/views/card_list_transaction_view.dart';
import 'package:andipublisher/app/views/views/ebook_card_list_transaction_view.dart';
import 'package:andipublisher/presentation/ebook_transaction/controllers/ebook_transaction.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:andipublisher/app/views/views/future_view.dart';


class EbookTransactionDoneView extends StatelessWidget {
  EbookTransactionDoneView({Key?key}) : super(key: key);

@override
  final EbookTransactionController controller = Get.put(EbookTransactionController());

  @override
  Widget build(BuildContext context) {
    return FutureView(
      future: controller.getListDone(),
      widgetBuilder: Obx(
        () => ListView.builder(
            itemCount: controller.listDone.length,
            itemBuilder: (context, index) =>
                EbookCardListTransactionView(data: controller.listDone[index])),
      ),
    );
  }
}