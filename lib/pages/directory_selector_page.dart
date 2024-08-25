import 'dart:io';

import 'package:flutter/material.dart';
import 'package:galerie/pages/gallery_page.dart';

class DirectorySelectorPage extends StatefulWidget {
  const DirectorySelectorPage({super.key});

  @override
  State<DirectorySelectorPage> createState() => _DirectorySelectorPageState();
}

class _DirectorySelectorPageState extends State<DirectorySelectorPage> {
  List<FileSystemEntity> _files = [];

  _DirectorySelectorPageState() {
    final directory = Directory('./dev/images_local');
    _files = directory.listSync();
  }

  @override
  Widget build(BuildContext context) {
    return GalleryPage(files: _files);
  }
}
