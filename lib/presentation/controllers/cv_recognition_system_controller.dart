import 'package:flutter/material.dart' hide CarouselController;
import 'dart:async';
import 'package:file_picker/file_picker.dart';

class CvRecognitionSystemController extends ChangeNotifier {
  CvRecognitionSystemController();

  Future<void> pickFiles(BuildContext context) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
      allowMultiple: true,
      withData: true,
    );

    if (result != null) {
      for (final file in result.files) {
        final fileSizeMB = file.size / (1024 * 1024); // Convert to MB
        if (fileSizeMB > 10) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('${file.name} exceeds the 10MB limit.'),
              backgroundColor: Colors.red,
            ),
          );
          return;
        }

        // ✅ You can handle valid file upload here
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Selected: ${file.name} (${fileSizeMB.toStringAsFixed(2)} MB)',
            ),
            backgroundColor: Colors.green,
          ),
        );
      }
    }
  }
}
