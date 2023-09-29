import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/ebook_transaction_detail.controller.dart';

class EbookTransactionDetailScreen
    extends GetView<EbookTransactionDetailController> {
  const EbookTransactionDetailScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EbookTransactionDetailScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'EbookTransactionDetailScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
