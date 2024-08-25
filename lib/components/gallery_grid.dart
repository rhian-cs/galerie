import 'dart:io';
import 'package:flutter/material.dart';

class GalleryGrid extends StatelessWidget {
  final int columnCount;

  const GalleryGrid({
    super.key,
    required List<String> filePaths,
    required this.columnCount,
  }) : _filePaths = filePaths;

  final List<String> _filePaths;

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: columnCount),
      children: [
        for (final path in _filePaths) ...[
          Image.file(File(path)),
        ],
      ],
    );
  }
}
