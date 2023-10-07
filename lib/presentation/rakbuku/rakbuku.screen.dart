import 'package:andipublisher/app/controllers/utils_controller.dart';
import 'package:andipublisher/app/data/models/rakbuku_model.dart';
import 'package:andipublisher/app/data/services/rakbuku_service.dart';
import 'package:andipublisher/app/views/views/request_login_view.dart';
import 'package:andipublisher/presentation/rakbuku/controllers/rakbuku.controller.dart';
import 'package:andipublisher/presentation/rakbuku/views/rakbuku_beli.dart';
import 'package:andipublisher/presentation/rakbuku/views/rakbuku_sewa.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RakbukuScreen extends StatelessWidget {
  const RakbukuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RakBukuController rakBukuController = RakBukuController();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: rakBukuController.searchController,
                  decoration: InputDecoration(
                    hintText: 'Cari Sesuatu ...',
                    suffixIcon: IconButton(
                      onPressed: () {
                        rakBukuController.clearSearchResults();
                      },
                      icon: Icon(Icons.clear),
                    ),
                  ),
                  onChanged: (query) {
                    rakBukuController.searchRakBuku(query);
                  },
                ),
              ),
              IconButton(
                onPressed: () {
                  // Aksi saat ikon filter ditekan
                },
                icon: Icon(Icons.filter_list),
              ),
            ],
          ),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                text: 'Rak Buku Beli',
              ),
              // Tab(
              //   text: 'Buku Sewa',
              // ),
            ],
          ),
        ),
        body: Obx(
          () => (!rakBukuController.utilsController.isLogin.value)
              ? RequestLoginView()
              : TabBarView(
                  children: [
                    RakBukuBeliScreen(),
                    // RakbukusewaScreen(),
                  ],
                ),
        ),
      ),
    );
  }
}
