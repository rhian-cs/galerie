import 'dart:io';
import 'package:flutter/material.dart';
import 'package:galerie/services/directory_reader.dart';

class GalleryPage extends StatefulWidget {
  final String directoryPath;

  const GalleryPage({
    super.key,
    required this.directoryPath,
  });

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  List<String> _filePaths = [];
  bool _loaded = false;

  @override
  void initState() {
    super.initState();

    DirectoryReader(widget.directoryPath).getImageFilePaths().then((value) {
      setState(() {
        _filePaths = value;
        _loaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_loaded) {
      return const Scaffold(
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('Loading...')],
            ),
          ],
        ),
      );
    }
    if (_filePaths.isEmpty) {
      return const Scaffold(
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('No image files were found.')],
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        children: [
          for (final path in _filePaths) ...[
            Image.file(File(path)),
          ],
        ],
      ),
    );
  }
}
