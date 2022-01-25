import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class CompartilhaController extends ChangeNotifier {
  Future<void> geraPdf() async {
    //Create a new PDF document
    PdfDocument document = PdfDocument();

    //Save the document
    List<int> bytes = document.save();

    //Dispose the document
    document.dispose();
//Get external storage directory
    final directory = await getApplicationDocumentsDirectory();

//Get directory path
    final path = directory.path;

//Create an empty file to write PDF data
    File file = File('$path/Output.pdf');

//Write PDF data
    await file.writeAsBytes(bytes, flush: true);

//Open the PDF document in mobile
    OpenFile.open('$path/Output.pdf');
  }
}
