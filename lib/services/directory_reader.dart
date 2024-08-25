import 'dart:io';

class DirectoryReader {
  final String directoryPath;
  DirectoryReader(this.directoryPath);

  Future<List<String>> getImageFilePaths() async {
    final directory = Directory(directoryPath);

    var paths = await directory.list().where((f) => _imageFile(f)).map((entry) => entry.path).toList();

    paths.sort();

    return paths;
  }

  _imageFile(FileSystemEntity file) {
    // If it's a directory
    if (Directory(file.path).existsSync()) return false;

    return _isSupportedExtension(file.path);
  }

  bool _isSupportedExtension(String path) {
    return path.endsWith('.jpg');
  }
}
