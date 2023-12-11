import 'dart:io';
import 'package:andipublisher/app/data/models/rakbuku_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
// import 'package:pspdfkit_flutter/pspdfkit.dart';

class DetailebookownedScreen extends StatefulWidget {
  final RakBukuModel data;

  const DetailebookownedScreen({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  _DetailebookownedScreenState createState() => _DetailebookownedScreenState();
}

class _DetailebookownedScreenState extends State<DetailebookownedScreen> {
  double progress = 0;
  bool didDownloadPDF = false;
  bool isRead = false;
  String progressString = 'File has not been downloaded yet';
  String fileName = '';
  var path = "";

  @override
  void initState() {
    super.initState();
    fileName = widget.data.judul + '.pdf';
    path = widget.data.file; // Path to the remote PDF file.
    checkIfFileExistsThenOpen();
  }

  void checkIfFileExistsThenOpen() async {
    var localPath = await getLocalPath();
    File file = File(p.join(localPath, fileName));

    if (file.existsSync()) {
      // Jika file sudah ada, buka file PDF.
      // openPDF(file.path);
    } else {
      // Jika file belum ada, download terlebih dahulu.
      await downloadPDF();
    }
  }

  Future<String> getLocalPath() async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future downloadPDF() async {
    try {
      var tempDir = await getTemporaryDirectory();
      await download(Dio(), path, p.join(tempDir.path, fileName));
    } catch (e) {
      print("Failed to download PDF: $e");
    }
  }

  // Future openPDF(String filePath) async {
  //   try {
  //     await Pspdfkit.present(filePath);
  //     print("PDF: $filePath");
  //     setState(() {
  //       isRead = true;
  //     });
  //   } catch (e) {
  //     print("PDF_ERROR: $e");
  //   }
  // }

  Future download(Dio dio, String url, String savePath) async {
    try {
      var response = await dio.get(
        url,
        onReceiveProgress: updateProgress,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      var file = File(savePath);
      await file.writeAsBytes(response.data, flush: true);

      setState(() {
        progressString =
            '✅ Ebook Sudah di download';
        didDownloadPDF = true;
      });

      // openPDF(file.path); // Buka PDF setelah selesai mengunduh.
    } catch (e) {
      setState(() {
        progressString = 'Failed to download the file';
      });
      print(e);
    }
  }

  void updateProgress(int done, int total) {
    setState(() {
      progress = done / total;
      if (progress >= 1) {
        progressString =
            '✅ Ebook Sudah di download';
        didDownloadPDF = true;
      } else {
        progressString = 'Download progress: ' +
            (progress * 100).toStringAsFixed(0) +
            '% done';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.data.judul),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Silahkan download ebook terlebih dulu',
              ),
              ElevatedButton(
                onPressed: didDownloadPDF
                    ? null
                    : () {
                        // Dalam metode ini, Anda bisa menambahkan logika untuk menentukan apakah perlu mendownload atau tidak.
                        // Misalnya, periksa apakah file dengan nama 'fileName' sudah ada di penyimpanan lokal,
                        // jika iya, maka Anda tidak perlu mendownload lagi.
                        // Implementasikan logika ini sesuai kebutuhan Anda.
                      },
                child: Text('Download'),
              ),
              Text(
                progressString,
              ),
              ElevatedButton(
                onPressed: !didDownloadPDF
                    ? null
                    : () {
                        var localPath = getLocalPath(); // Dapatkan lokasi penyimpanan lokal Anda.
                        var filePath = p.join(localPath as String, fileName);

                        // openPDF(filePath);
                      },
                child: Text('Baca Buku'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
