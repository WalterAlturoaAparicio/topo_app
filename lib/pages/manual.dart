import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ManualPage extends StatefulWidget {
  const ManualPage({Key? key}) : super(key: key);

  @override
  State<ManualPage> createState() => _ManualPageState();
}

class _ManualPageState extends State<ManualPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          title: const Text("Manual"),
          backgroundColor: HexColor("#0b0d24"),
          leading: Padding(
              padding: const EdgeInsets.all(5.0),
              child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    "assets/images/logoTopoApp.jpg",
                  )))),
      body: SfPdfViewer.asset("assets/Manual de usuario - TopoApp.pdf"),
    ));
  }
}
