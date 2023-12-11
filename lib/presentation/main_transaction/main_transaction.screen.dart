import 'package:andipublisher/presentation/ebook_transaction/ebook_transaction.screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/main_transaction.controller.dart';

class MainTransactionScreen extends GetView<MainTransactionController> {
  const MainTransactionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Riwayat Transaksi'),
        centerTitle: true,
      ),
      body: EbookTransactionScreen(),
    );
  }
}
