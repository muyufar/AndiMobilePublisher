import 'package:andipublisher/presentation/rakbuku/controllers/rakbuku.controller.dart';
import 'package:andipublisher/presentation/rakbuku/views/rakbuku_beli.dart';
import 'package:andipublisher/presentation/rakbuku/views/rakbuku_sewa.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RakbukuScreen extends StatelessWidget {
  const RakbukuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(RakBukuController());
    return DefaultTabController(
      length: 2, // Jumlah tab
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Rak Buku'),
          bottom: TabBar(
            tabs: [
              Tab(
                  text:
                      'Buku Beli'), // Tab pertama untuk buku yang sudah dibeli
              Tab(text: 'Buku Sewa'), // Tab kedua untuk buku yang sudah disewa
            ],
          ),
        ),
        body: TabBarView(
          children: [
            RakBukuBeliScreen(),
            Rakbukusewa(),
          ],
        ),
      ),
    );
  }
}
