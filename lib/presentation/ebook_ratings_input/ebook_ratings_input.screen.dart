import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/ebook_ratings_input.controller.dart';

class EbookRatingsInputScreen extends GetView<EbookRatingsInputController> {
  const EbookRatingsInputScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EbookRatingsInputScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'EbookRatingsInputScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
