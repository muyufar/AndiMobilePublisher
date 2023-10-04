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
        appBar: _appBar(),
        body: Obx(
          () => (!rakBukuController.utilsController.isLogin.value)
              ? RequestLoginView()
              : TabBarView(
                  children: [
                    RakBukuBeliScreen(),
                    RakbukusewaScreen(),
                  ],
                ),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Row(
        children: [
          Expanded(
            child: TextField(
              readOnly: true,
              decoration: InputDecoration(hintText: 'Cari Sesuatu ...'),
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
            text: 'Buku Beli',
          ),
          Tab(
            text: 'Buku Sewa',
          ),
        ],
      ),
    );
  }
}
