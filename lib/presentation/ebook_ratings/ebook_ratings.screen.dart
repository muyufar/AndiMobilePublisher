import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/ebook_ratings.controller.dart';

class EbookRatingsScreen extends GetView<EbookRatingsController> {
  const EbookRatingsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Penilaian Saya'),
        centerTitle: false,
      ),
      body: const Center(
        child: Text(
          'EbookRatingsScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
