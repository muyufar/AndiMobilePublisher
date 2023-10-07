import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/cart.controller.dart';

class CartScreen extends GetView<CartController> {
  const CartScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keranjang Belanja'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Keranjang Belanja Kosong',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
