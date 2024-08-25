import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:galerie/components/centered_scaffold.dart';
import 'package:galerie/components/galerie_app_bar.dart';
import 'package:galerie/components/gallery_column_slider.dart';
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
  int columnCount = 3;

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
      body: Column(
        children: [
          Row(
            children: [
              const Spacer(flex: 8),
              Expanded(
                flex: 2,
                child: GalleryColumnSlider(
                  columnCount: columnCount,
                  onChange: (value) {
                    setState(() {
                      columnCount = value;
                    });
                  },
                ),
              ),
            ],
          ),
          Expanded(child: GalleryGrid(filePaths: _filePaths, columnCount: columnCount)),
          // Text('aaa')
        ],
      ),
    );
  }
}
