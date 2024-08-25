import 'dart:io';

class DirectoryReader {
  final String directoryPath;
  DirectoryReader(this.directoryPath);

  Future<List<String>> getFilePaths() {
    final directory = Directory(directoryPath);

    return directory.list().map((entry) => entry.path).toList();
  }
}
