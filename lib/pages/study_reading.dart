import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:skill_it/models/studyModel.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class reading extends StatefulWidget {
   reading(this.doc,{ super.key});
  Document doc;

  @override
  State<reading> createState() => _readingState();
}

class _readingState extends State<reading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff443C68),
        title: Text(widget.doc.doc_title!),
      ),
      body: Container(
        child: SfPdfViewer.network(widget.doc.doc_url!),
      ),
    );
  }
}