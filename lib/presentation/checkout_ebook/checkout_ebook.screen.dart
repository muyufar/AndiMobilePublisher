import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import 'controllers/checkout_ebook.controller.dart';

class CheckoutEbookScreen extends GetView<CheckoutEbookController> {
  const CheckoutEbookScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('CheckoutEbookScreen'),
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Ionicons.chevron_back),
          ),
        ),
        body: ListView(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.checkoutEbookModel.dataCheckout.length,
              itemBuilder: (context, index) => _dataItms(
                  data: controller.checkoutEbookModel.dataCheckout[index],
                  index: index),
            ),
            //Voucher
            _voucher(),

            //Ringkasan Belanja
            _infoOrder(),

            //footer button
            _footer()
          ],
        ));
  }
}
