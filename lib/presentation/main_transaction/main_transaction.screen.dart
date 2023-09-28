import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/main_transaction.controller.dart';

class MainTransactionScreen extends GetView<MainTransactionController> {
  const MainTransactionScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MainTransactionScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MainTransactionScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
