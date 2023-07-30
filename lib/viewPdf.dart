import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class viewPdf extends StatelessWidget {

  final String pdfPath;

  const viewPdf({required this.pdfPath,super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff9288F8),
        title: Text(pdfPath.split("/").last),
      ),
      body: PDFView(
        filePath: pdfPath,
        enableSwipe: true,
        swipeHorizontal: true,
        autoSpacing: false,
        pageFling: false,
        pageSnap: true,
        defaultPage: 0,
        fitPolicy: FitPolicy.BOTH,
      ),
    );
  }
}