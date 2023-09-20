import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/rakbuku.controller.dart';

class RakbukuScreen extends GetView<RakbukuController> {
  const RakbukuScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RakbukuScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RakbukuScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
