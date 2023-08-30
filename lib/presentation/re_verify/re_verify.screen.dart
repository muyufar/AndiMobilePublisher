import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/re_verify.controller.dart';

class ReVerifyScreen extends GetView<ReVerifyController> {
  const ReVerifyScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ReVerifyScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ReVerifyScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
