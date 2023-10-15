import 'dart:io';
import 'package:andipublisher/app/data/models/rakbuku_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:dio/dio.dart';
import 'package:pspdfkit_flutter/pspdfkit.dart';

class RakBukuView extends StatelessWidget {
  final RakBukuModel data;

  RakBukuView(this.data, {Key? key}) : super(key: key);

  Future<bool> _downloadEbook(String ebookUrl) async {
    final pdfFile = File(await _getLocalPDFPath(ebookUrl));

    try {
      final dio = Dio();
      dio.interceptors.add(
          LogInterceptor()); // Opsional, untuk melihat log request/response di konsol.

      bool downloadInProgress = true;
      double progress = 0;

      final response = await dio.download(
        ebookUrl,
        pdfFile.path,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            progress = (received / total) * 100;
            if (progress == 100) {
              downloadInProgress = false;
            }
          }
        },
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to download PDF');
      }

      await Pspdfkit.present(pdfFile.path);
      return true; // Return true when the download and open is successful.
    } catch (e) {
      print("PDF_ERROR: $e");
      return false; // Return false if there is an error.
    }
  }

  Future<String> _getLocalPDFPath(String url) async {
    final tempDir = await Pspdfkit.getTemporaryDirectory(); // Ganti Pspdfkit.getTemporaryDirectory() dengan getTemporaryDirectory()
    final fileName = Uri.parse(url).pathSegments.last;
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
                  data.gambar1,
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
                                value: loadingProgress.cumulativeBytesLoaded! /
                                    loadingProgress.expectedTotalBytes!,
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
                      data.judul,
                      maxLines: 3,
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
        title: Text('Download Ebook'),
      ),
      body: Center(
        child: FutureBuilder<bool>(
          future: _checkIfFileExists(),
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
              return _buildDownloadButton();
            } else {
              return _buildOpenButton();
            }
          },
        ),
      ),
    );
  }

  Future<bool> _checkIfFileExists() async {
    final localPath = await _getLocalPDFPath(data.file);
    final file = File(localPath);
    return file.existsSync();
  }

  Widget _buildDownloadButton() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: () async {
            final result = await _downloadEbook(data.file);
            if (result) {
              // File berhasil diunduh, tampilkan tombol untuk membuka ebook.
              Get.to(_buildOpenButton());
            }
          },
          child: Text('Download Ebook'),
        ),
        SizedBox(height: 16),
        Text('Ebook has not been downloaded yet'),
      ],
    );
  }

  Widget _buildOpenButton() {
    return ElevatedButton(
      onPressed: () async {
        final localPath = await _getLocalPDFPath(data.file);
        await Pspdfkit.present(localPath);
      },
      child: Text('Open Ebook'),
    );
  }
}
