import 'dart:io';

class FileReader {
  Future<String?> readFileContents(String filePath) async {
    final file = File(filePath);
    if (await file.exists()) {
      return await file.readAsString();
    } else {
      print("File does not exist");
      return null;
    }
  }
}
