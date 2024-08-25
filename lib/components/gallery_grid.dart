import 'dart:io';
import 'package:flutter/material.dart';

class GalleryGrid extends StatelessWidget {
  const GalleryGrid({
    super.key,
    required List<String> filePaths,
  }) : _filePaths = filePaths;

  final List<String> _filePaths;

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 8),
      children: [
        for (final path in _filePaths) ...[
          Image.file(File(path)),
        ],
      ],
    );
  }
}
