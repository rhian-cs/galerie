import 'dart:io';
import 'package:flutter/material.dart';
import 'package:galerie/services/directory_parser.dart';

class GalleryPage extends StatelessWidget {
  final List<FileSystemEntity> _files;

  GalleryPage({
    super.key,
    required String directoryPath,
  }) : _files = DirectoryParser().readDirectoryFiles(directoryPath);

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      children: [
        for (final file in _files) ...[
          Image.file(
            File(file.path),
          ),
        ],
      ],
    );
  }
}
