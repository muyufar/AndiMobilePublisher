import 'package:andipublisher/presentation/rakbuku/controllers/rakbuku.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class RakBukuBeliScreen extends StatelessWidget {
  final RakBukuController rakBukuController = Get.put(RakBukuController());

  RakBukuBeliScreen() {
    rakBukuController.getRakbuku('US202006190000000000', 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => ListView.builder(
          itemCount: rakBukuController.rakBukuBeli.length,
          itemBuilder: (context, index) {
            final rakBuku = rakBukuController.rakBukuBeli[index];
            return ListTile(
              onTap: () {
                // Implementasikan tindakan untuk membuka ebook di sini
                _openEbook(rakBuku.file);
              },
              title: Row(
                children: [
                  // Gambar kotak rounded
                  Container(
                    width: 110, // Sesuaikan dengan ukuran yang Anda inginkan
                    height: 150, // Sesuaikan dengan ukuran yang Anda inginkan
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), // Sudut bulat
                      color: Colors.grey, // Warna latar belakang (bisa diganti)
                      image: DecorationImage(
                        image: NetworkImage(
                            rakBuku.gambar1), // URL gambar dari data
                        fit: BoxFit.cover, // Mengisi container
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16, // Jarak horizontal antara gambar dan judul
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          rakBuku.judul,
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                            height: 8), // Jarak antara judul dan elemen lainnya
                        // Tambahkan widget lain sesuai data buku yang diperlukan
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _openEbook(String ebookUrl) {
    Get.to(
      Scaffold(
        appBar: AppBar(
          title: Text('Ebook'), // Judul aplikasi penampil PDF
        ),
        body: SfPdfViewer.network(
          ebookUrl, // URL ebook dari data
        ),
      ),
    );
  }
}
