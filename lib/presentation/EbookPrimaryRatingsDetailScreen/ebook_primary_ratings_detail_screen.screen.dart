import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/ebook_primary_ratings_detail_screen.controller.dart';

class EbookPrimaryRatingsDetailScreenScreen
    extends GetView<EbookPrimaryRatingsDetailScreenController> {
  const EbookPrimaryRatingsDetailScreenScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EbookPrimaryRatingsDetailScreenScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'EbookPrimaryRatingsDetailScreenScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
