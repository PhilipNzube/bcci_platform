import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class CvRecognitionSystemController extends ChangeNotifier {
  List<PlatformFile> selectedFiles = [];

  Future<void> pickFiles(BuildContext context) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
      allowMultiple: true,
      withData: true,
    );

    if (result != null) {
      bool allFilesValid = true;

      for (final file in result.files) {
        final fileSizeMB = file.size / (1024 * 1024);
        if (fileSizeMB > 10) {
          allFilesValid = false;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('${file.name} exceeds the 10MB limit.'),
              backgroundColor: Colors.red,
            ),
          );
        } else {
          selectedFiles.add(file);
        }
      }

      if (allFilesValid) {
        notifyListeners();
      }
    }
  }

  void removeFileAt(int index) {
    selectedFiles.removeAt(index);
    notifyListeners();
  }

  void clearAllFiles() {
    selectedFiles.clear();
    notifyListeners();
  }
}
