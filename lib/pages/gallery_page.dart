import 'dart:io';
import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({
    super.key,
    required List<FileSystemEntity> files,
  }) : _files = files;

  final List<FileSystemEntity> _files;

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
