import 'dart:io';

class DirectoryParser {
  List<FileSystemEntity> readDirectoryFiles(final String directoryPath) {
    final directory = Directory(directoryPath);
    final files = directory.listSync();

    return files;
  }
}
