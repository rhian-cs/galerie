import 'package:flutter/material.dart';
import 'package:galerie/components/centered_scaffold.dart';
import 'package:galerie/components/galerie_app_bar.dart';
import 'package:galerie/components/gallery_grid.dart';
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
    const appBar = GalerieAppBar();

    if (!_loaded) {
      return const CenteredScaffold(
        appBar: appBar,
        children: [Text('Loading...')],
      );
    }

    if (_filePaths.isEmpty) {
      return const CenteredScaffold(
        appBar: appBar,
        children: [Text('No image files were found.')],
      );
    }

    return Scaffold(
      appBar: appBar,
      body: GalleryGrid(filePaths: _filePaths),
    );
  }
}
