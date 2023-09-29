import 'package:andipublisher/app/views/views/request_login_view.dart';
import 'package:andipublisher/infrastructure/theme/theme_utils.dart';
import 'package:andipublisher/presentation/transaction/views/transaction_canceled_view.dart';
import 'package:andipublisher/presentation/transaction/views/transaction_done_view.dart';
import 'package:andipublisher/presentation/transaction/views/transaction_processed_view.dart';
import 'package:andipublisher/presentation/transaction/views/transaction_send_view.dart';
import 'package:andipublisher/presentation/transaction/views/transaction_unpaid_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/transaction.controller.dart';

class TransactionScreen extends GetView<TransactionController> {
  const TransactionScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(TransactionController());

    return Obx(
      () => (!controller.utilsController.isLogin.value)
          ? Scaffold(
              appBar: AppBar(
                foregroundColor: colorBlack,
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: const Text(''),
                centerTitle: true,
              ),
              body: const RequestLoginView())
          : DefaultTabController(
              length: 5,
              child: Scaffold(
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(50), // Menghilangkan tinggi AppBar
                  child: AppBar(
                    // Setting padding sisi atas ke nol
                    titleSpacing: 0,
                    foregroundColor: colorBlack,
                    backgroundColor: Colors.transparent,
                   
                    elevation: 0,
                    bottom: TabBar(
                       labelColor: Colors.black,
                      isScrollable: true,
                      tabs: [
                        Tab(text: 'Belum Dibayar'),
                        Tab(text: 'Diproses'),
                        Tab(text: 'Dikirim'),
                        Tab(text: 'Selesai'),
                        Tab(text: 'Dibatalkan'),
                      ],
                    ),
                  ),
                ),
                body: TabBarView(
                  dragStartBehavior: DragStartBehavior.down,
                  children: [
                    TransactionUnpaidView(),
                    TransactionProcessedView(),
                    TransactionSendView(),
                    TransactionDoneView(),
                    TransactionCanceledView()
                  ],
                ),
              ),
            ),
    );
  }
}
