import 'package:andipublisher/presentation/ebook_transaction/ebook_transaction.screen.dart';
import 'package:andipublisher/presentation/transaction/transaction.screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/main_transaction.controller.dart';

class MainTransactionScreen extends GetView<MainTransactionController> {
  const MainTransactionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Dua tab: Transaction dan EbookTransaction
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppBar(
            foregroundColor: Colors.black,
            backgroundColor: Colors.transparent,
            elevation: 0,
            // title: const Text('History Transaksi'),
            centerTitle: true,
            // actions: [
            //   // Tambahkan tombol atau widget lain di sini
            //   IconButton(
            //     onPressed: () {
            //       // Aksi saat tombol ditekan
            //     },
            //     icon: Icon(Icons.add), // Ganti dengan ikon yang sesuai
            //   ),
            // ],
            bottom: TabBar(
              
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              indicator: BoxDecoration(
                // borderRadius: BorderRadius.circular(40),
                color: Colors.blueAccent,
              ),
              tabs: [
                Tab(text: 'Transaksi Produk'),
                Tab(text: 'Transaksi Ebook'),
              ],
            ),
          ),
        ),
        body: TabBarView(
          // Mengganti TabBarView dengan ListView
          children: [
            TransactionScreen(),
            EbookTransactionScreen(),
          ],
        ),
      ),
    );
  }
}
