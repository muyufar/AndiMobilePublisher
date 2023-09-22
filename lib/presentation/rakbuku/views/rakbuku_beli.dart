import 'package:andipublisher/app/data/models/rakbuku_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:andipublisher/presentation/rakbuku/controllers/rakbuku.controller.dart';

class RakBukuBeliScreen extends StatelessWidget {
  final RakBukuController rakBukuController = Get.put(RakBukuController());

  RakBukuBeliScreen() {
    rakBukuController.getRakbuku('US202006190000000000', 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          if (rakBukuController.isLoading.value) {
            // Tampilkan indikator loading jika data masih dimuat
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Mengatur jumlah kolom dalam grid
                crossAxisSpacing: 10, // Jarak antara kolom
                mainAxisSpacing: 20, // Jarak antara baris
              ),
              itemCount: rakBukuController.rakBukuBeli.length,
              itemBuilder: (context, index) {
                final rakBuku = rakBukuController.rakBukuBeli[index];
                return _buildBookCard(rakBuku);
              },
            );
          }
        },
      ),
    );
  }

  Widget _buildBookCard(RakBukuModel rakBuku) {
    return InkWell(
      onTap: () {
        _openEbook(rakBuku.file);
      },
      // elevation: 2,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 0.66 / 1,
              child: Stack(
                children: [
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                      image: DecorationImage(
                        image: NetworkImage(rakBuku.gambar1),
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Tambahkan batas bawah untuk menghindari overflow
                    margin: EdgeInsets.only(bottom: 10),
                  ),
                  Text(
                    rakBuku.judul,
                    style: TextStyle(fontSize: 13),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
            // Cover Buku

            // Judul Buku di bawah cover
          ],
        ),
      ),
    );
  }

  void _openEbook(String ebookUrl) {
    Get.to(
      Scaffold(
        appBar: AppBar(
          title: Text('Ebook'),
        ),
        body: SfPdfViewer.network(
          ebookUrl,
        ),
      ),
    );
  }
}
