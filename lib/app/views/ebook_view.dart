import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import 'package:shared_preferences/shared_preferences.dart';

class EbookView extends StatefulWidget {
  final String ebookUrl;

  const EbookView({required this.ebookUrl, Key? key}) : super(key: key);

  @override
  _EbookViewState createState() => _EbookViewState();
}

class _EbookViewState extends State<EbookView> {
  late PdfViewerController _pdfViewerController;
  late SharedPreferences _prefs;
  List<int> _bookmarkedPages = [];

  @override
  void initState() {
    super.initState();
    _pdfViewerController = PdfViewerController();
    SharedPreferences.getInstance().then((prefs) {
      _prefs = prefs;
      _loadBookmarkedPages();
    });
  }

  void _loadBookmarkedPages() {
    final bookmarks = _prefs.getStringList('bookmarks');
    if (bookmarks != null) {
      _bookmarkedPages = bookmarks.map((page) => int.parse(page)).toList();
    }
  }

  Future<void> _saveBookmarkedPages() async {
    final bookmarks = _bookmarkedPages.map((page) => page.toString()).toList();
    await _prefs.setStringList('bookmarks', bookmarks);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ebook'),
        actions: [
          IconButton(
            icon: Icon(Icons.bookmark),
            onPressed: () {
              final currentPage = _pdfViewerController.pageNumber;
              if (!_bookmarkedPages.contains(currentPage)) {
                _bookmarkedPages.add(currentPage);
                _saveBookmarkedPages();
                setState(() {});
              }
            },
          ),
        ],
      ),
      body: SfPdfViewer.network(
        widget.ebookUrl,
        controller: _pdfViewerController,
        onPageChanged: (pageDetails) {
          // You can use this callback to update UI when the page changes.
        },
        onDocumentLoaded: (document) {
          // You can use this callback when the document is loaded.
          // Restore bookmarks here if needed.
        },
      ),
    );
  }
}
