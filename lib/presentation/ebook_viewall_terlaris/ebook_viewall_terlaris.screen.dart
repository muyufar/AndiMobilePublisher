import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/ebook_viewall_terlaris.controller.dart';

class EbookViewallTerlarisScreen
    extends GetView<EbookViewallTerlarisController> {
  const EbookViewallTerlarisScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EbookViewallTerlarisScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'EbookViewallTerlarisScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
