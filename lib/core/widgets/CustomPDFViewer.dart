import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:monstersmoke/core/PDFs/PDFfunctions.dart';

class PdfPreviewPage extends StatefulWidget {
  final String pdf;

  const PdfPreviewPage({
    super.key,
    required this.pdf,
  });

  @override
  State<PdfPreviewPage> createState() => _PdfPreviewPageState();
}

class _PdfPreviewPageState extends State<PdfPreviewPage> {
  @override
  void dispose() {
    onDispose();
    super.dispose();
  }

  onDispose() async {
    await MakePDF.saveTempPdf(widget.pdf);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Preview'),
      ),
      body: PDFView(
        filePath: widget.pdf,
        // pdfData: Uint8List.fromList(widget.pdf.codeUnits),
        enableSwipe: true,
        swipeHorizontal: true,
        autoSpacing: false,
        pageFling: false,
        onRender: (pages) {
          setState(() {
            // pages = _pages;
          });
          log('$pages');
        },
        onError: (error) {
          log(error.toString());
        },
        onPageError: (page, error) {
          log('$page: ${error.toString()}');
        },
        onViewCreated: (PDFViewController pdfViewController) {
          log('created Successfully');
        },
        // onPageChanged: (int page, int total) {
        //   // log('page change: $page/$total');
        // },
      ),
    );
  }
}
