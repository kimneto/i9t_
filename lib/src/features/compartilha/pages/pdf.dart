// ignore_for_file: public_member_api_docs

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PdfHome extends StatelessWidget {
  const PdfHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: PdfPreview(
          build: (format) => _generatePdf(format.landscape, 'FCT 001'),
        ),
      ),
    );
  }

  Future<Uint8List> _generatePdf(PdfPageFormat format, String title) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
    final font = await PdfGoogleFonts.nunitoExtraLight();

    final brasao = pw.MemoryImage(
      (await rootBundle.load('assets/image/brasao.png')).buffer.asUint8List(),
    );
    pdf.addPage(
      pw.Page(
        margin: pw.EdgeInsets.zero,
        pageFormat: format,
        build: (context) {
          return pw.Row(
            children: [
              pw.Column(children: [
                pw.Container(
                    width: 842,
                    height: 595,
                    color: PdfColor.fromHex('#f0f0f0'),
                    child: pw.Column(children: [
                      pw.Row(children: [
                        pw.Column(children: [
                          pw.Row(
                            children: [
                              pw.Container(
                                  width: 60,
                                  height: 60,
                                  padding: const pw.EdgeInsets.all(4.0),
                                  child: pw.Center(
                                    child: pw.Image(brasao, height: 50),
                                  )),
                              pw.Column(children: [
                                pw.Container(
                                  color: PdfColor.fromHex('#a1a1a1'),
                                  width: 120,
                                  height: 20,
                                  child: pw.Text(
                                    'Secretaria...............................................',
                                    style: pw.TextStyle(
                                        font: font,
                                        fontSize: 6,
                                        color: PdfColor.fromHex('#000000')),
                                  ),
                                ),
                              ]),
                            ],
                          )
                        ]),
                        pw.Column(),
                      ])
                    ])),
              ]),
              pw.SizedBox(width: 5),
            ],
          );
        },
      ),
    );

    return pdf.save();
  }
}
