import 'package:finniu/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'Syncfusion PDF Viewer Demo',
      home: PdfPage(),
    ),
  );
}

class PdfPage extends StatefulWidget {
  const PdfPage({super.key});

  @override
  _PdfPage createState() => _PdfPage();
}

class _PdfPage extends State<PdfPage> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(backgroundColorDark),
        title: const Text('Contrato Finniu',
            style: TextStyle(
                color: Color(primaryLight), fontWeight: FontWeight.bold)),
        actions: <Widget>[],
      ),
      body: SfPdfViewer.network(
        'http://www.lineaverdemunicipal.com/Recursos-educacion-ambiental/Animales-Ecosistemas.pdf',
        key: _pdfViewerKey,
      ),
    );
  }
}