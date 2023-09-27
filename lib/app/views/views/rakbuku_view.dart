import 'package:andipublisher/app/data/models/rakbuku_model.dart';
import 'package:andipublisher/app/views/views/image_network_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';






class RakBukuView extends StatelessWidget {
  final RakBukuModel data;
  // late PdfViewerController _pdfViewerController;
  final GlobalKey<SfPdfViewerState> _pdfViewerStateKey = GlobalKey();
   RakBukuView(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _openEbook(data.file);
      },
      child: Container(
        // aspectRatio: 2 / 4.4,
        width: 118,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(color: Colors.white,
        borderRadius: BorderRadius.circular(8)),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 0.66 / 1,
                child: Stack(
                  children: [
                    ImageNetworkView(
                          url: data.gambar1,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(10))),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.judul,
                      maxLines: 2,
                      style: const TextStyle(fontSize: 15),
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

  void _openEbook(String ebookUrl, )async {  await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);

    Get.to(
      Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(onPressed: (){
              _pdfViewerStateKey.currentState!.openBookmarkView();
            }, icon: Icon(Icons.bookmark, color: Colors.white,)),
            //  IconButton(onPressed: (){
            //   _pdfViewerController.jumpToPage(5);
            // }, icon: Icon(Icons.arrow_drop_down_circle, color: Colors.white,)),
          ],
          title: const Text('Ebook'),
        ),
        body: SfPdfViewer.network(
          ebookUrl, key: _pdfViewerStateKey,
        ),
      ),
    );
  }
}
