import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/ebook_kategori_list.controller.dart';

class EbookKategoriListScreen extends GetView<EbookKategoriListController> {
  const EbookKategoriListScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kategori'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'EbookKategoriListScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
