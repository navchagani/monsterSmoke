import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class MakePDF {
  static Future<File> saveTempPdf(String pdfContent) async {
    final tempDir = await getTemporaryDirectory();
    final tempPath = tempDir.path;
    final tempFile = File('$tempPath/temp_pdf.pdf');

    final decodedContent = base64.decode(pdfContent);
    await tempFile.writeAsBytes(decodedContent);

    return tempFile;
  }

  static Future<void> deleteTempPdf() async {
    final tempDir = await getTemporaryDirectory();
    final tempPath = tempDir.path;
    final tempFile = File('$tempPath/temp_pdf.pdf');

    if (await tempFile.exists()) {
      await tempFile.delete();
    }
  }
}
