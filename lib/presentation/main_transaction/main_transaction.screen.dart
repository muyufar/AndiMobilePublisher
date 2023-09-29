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
        appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text('History Transaksi'),
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
        ),
        body: TabBarView(
          // Mengganti TabBarView dengan ListView
          children: [
            TransactionScreen(),
            EbookTransactionScreen(),
          ],
        ),
        bottomNavigationBar: Container(
          // Menggunakan bottomNavigationBar untuk menempatkan TabBar di bawah
          decoration: BoxDecoration(
            color: Colors.white, // Warna latar belakang bottomNavigationBar
            boxShadow: [
              // Efek bayangan di bawah bottomNavigationBar
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 4,
                offset: Offset(0, -1),
              ),
            ],
          ),
          child: TabBar(
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
    );
  }
}
// Dalam kode di atas, saya mengubah TabBar menjadi bottomNavigationBar dengan meletakkannya di dalam properti bottomNavigationBar dari Scaffold. BottomNavigationBar ini diberi latar belakang putih dan bayangan untuk membuatnya tampak seperti bagian bawah aplikasi. Anda dapat menyesuaikan warna dan gaya sesuai preferensi Anda.






