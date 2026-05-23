import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class PdfViewer extends StatelessWidget {
  const PdfViewer({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: PDF().cachedFromUrl(
        url,
        placeholder: (b) {
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
