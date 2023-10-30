import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:andipublisher/app/views/views/rakbuku_view.dart';
import 'dart:io';

class PDFViewerView extends StatefulWidget {
  final String pdfFilePath;
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  PDFViewerView({required this.pdfFilePath});

  @override
  _PDFViewerViewState createState() => _PDFViewerViewState();
}

class _PDFViewerViewState extends State<PDFViewerView> {
  late File pdfFile;

  @override
  void initState() {
    super.initState();
    pdfFile = File(widget.pdfFilePath);
    FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

  @override
  void dispose() {
    FlutterWindowManager.clearFlags(FlutterWindowManager.FLAG_SECURE);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
         Navigator.pop(context);
        Navigator.pop(context); // Navigate back when the back button is pressed
        return true;
        
      },
      child: Scaffold(
        
        appBar: AppBar(
          
          title: Text('Membaca Ebook'),
        ),
        
        body: SfPdfViewer.file(
          pdfFile,
        ),
      ),
    );
  }
}
