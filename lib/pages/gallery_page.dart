import 'dart:io';
import 'package:flutter/material.dart';
import 'package:galerie/services/directory_reader.dart';

class GalleryPage extends StatefulWidget {
  final String directoryPath;

  GalleryPage({
    super.key,
    required this.directoryPath,
  });

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  List<String> _file_paths = [];
  bool _loaded = false;

  @override
  void initState() {
    super.initState();

    DirectoryReader(widget.directoryPath).getFilePaths().then((value) {
      setState(() {
        _file_paths = value;
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

    return Scaffold(
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        children: [
          for (final path in _file_paths) ...[
            Image.file(File(path)),
          ],
        ],
      ),
    );
  }
}
