import 'dart:io';
import 'package:andipublisher/app/data/models/rakbuku_model.dart';
import 'package:andipublisher/app/views/views/image_network_view.dart';
import 'package:andipublisher/infrastructure/theme/theme_utils.dart';
import 'package:andipublisher/presentation/ebook_detail/controllers/ebook_detail.controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:dio/dio.dart';
import 'package:pspdfkit_flutter/pspdfkit.dart';
import 'package:readmore/readmore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class RakBukuView extends StatefulWidget {
  final RakBukuModel data;

  @override
  final EbookDetailController controller = Get.put(EbookDetailController());

  RakBukuView(this.data, {Key? key}) : super(key: key);

  @override
  _RakBukuViewState createState() => _RakBukuViewState();
}

class _RakBukuViewState extends State<RakBukuView> {
  bool downloading = false; // Menambahkan flag `downloading`
  double downloadProgress = 0.0;
  bool showIndicator = false;
 // Menambahkan `downloadProgress`

  Future<bool> _downloadEbook(String ebookUrl, String idEbook) async {
    final pdfFile = File(await _getLocalPDFPath(idEbook));

    try {
      final dio = Dio();
      dio.interceptors.add(LogInterceptor());

      final response = await dio.download(
        ebookUrl,
        pdfFile.path,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            setState(() {
              downloadProgress = (received / total) * 100;
            });
            if (downloadProgress == 100) {
              downloading = false;
            }
          }
        },
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to download PDF');
      }

      await Pspdfkit.present(pdfFile.path);
      return true;
    } catch (e) {
      print("PDF_ERROR: $e");
      return false;
    }
  }

  Future<String> _getLocalPDFPath(String idEbook) async {
    final tempDir = await Pspdfkit.getTemporaryDirectory();
    final fileName = '$idEbook.pdf';
    return '${tempDir.path}/$fileName';
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
        Get.to(_buildDownloadEbookScreen());
      },
      child: AspectRatio(
        aspectRatio: 2 / 4.4,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 0.70 / 1,
                child: Image.network(
                  widget.data.gambar1,
                  fit: BoxFit.fill,
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return Center(
                      child: Icon(Icons.error),
                    );
                  },
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return Stack(
                        children: [
                          child,
                          if (loadingProgress.cumulativeBytesLoaded! <
                              loadingProgress.expectedTotalBytes!)
                            Center(
                              child: CircularProgressIndicator(
                                value: downloadProgress / 100,
                              ),
                            ),
                        ],
                      );
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.data.judul,
                      maxLines: 2,
                      style: const TextStyle(fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDownloadEbookScreen() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rak Buku Beli'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider.builder(
              itemCount: widget.data.gambar1.length,
              itemBuilder: (context, index, realIndex) {
                return Container(
                  height: Get.width - 100,
                  width: Get.width - 100,
                  margin: const EdgeInsets.only(bottom: 28, top: 10),
                  padding: const EdgeInsets.symmetric(vertical: 28),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [BoxShadow(blurRadius: 10, color: Colors.grey)],
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: AspectRatio(
                          aspectRatio: 2.2 / 3,
                          child: ImageNetworkView(
                            url: widget.data.gambar1,
                            fit: BoxFit.fill,
                            decoration:
                                BoxDecoration(borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              options: CarouselOptions(
                autoPlay: (widget.data.gambar1.length != 1),
                aspectRatio: 1 / 1,
                viewportFraction: 1,
                enlargeCenterPage: true,
                autoPlayInterval: const Duration(seconds: 10),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Deskripsi',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: ReadMoreText(
                widget.data.deskripsi,
                trimMode: TrimMode.Length,
                moreStyle: TextStyle(color: colorTextPrimary),
                lessStyle: TextStyle(color: colorTextPrimary),
                trimCollapsedText: 'Baca Selengkapnya',
                trimExpandedText: ' Sembunyikan',
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        child: FutureBuilder<bool>(
          future: _checkIfFileExists(widget.data.idEbook),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Checking...'),
                ],
              );
            } else if (snapshot.hasError || !snapshot.data!) {
              return _buildDownloadButton(widget.data.idEbook);
            } else {
              return _buildOpenButton(widget.data.idEbook);
            }
          },
        ),
      ),
    );
  }

  Future<bool> _checkIfFileExists(String idEbook) async {
    final localPath = await _getLocalPDFPath(idEbook);
    final file = File(localPath);
    return file.existsSync();
  }

  Widget _buildDownloadButton(String idEbook) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      ElevatedButton(
        onPressed: () async {
          setState(() {
            downloading = true;
            showIndicator = true;
          });

          final result = await _downloadEbook(widget.data.file, idEbook);

          setState(() {
            downloading = false;
            showIndicator = false;
          });

          if (result) {
            Get.to(_buildOpenButton(widget.data.idEbook));
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            showIndicator
                ? SpinKitThreeBounce(
                    color: Colors.white,
                    size: 25.0,
                  )
                : Text(
                    'Download Ebook',
                    style: TextStyle(fontSize: 16),
                  ),
          ],
        ),
      ),
    ],
  );
}


  Widget _buildOpenButton(String idEbook) {
    return ElevatedButton(
      onPressed: () async {
        final localPath = await _getLocalPDFPath(idEbook);
        await Pspdfkit.present(localPath);
      },
      child: Text(
        '  Open Ebook  ',
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
