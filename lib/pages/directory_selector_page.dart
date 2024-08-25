import 'dart:io';

import 'package:file_picker/file_picker.dart';
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: chooseFile,
              child: const Text('Choose a directory'),
            ),
          ],
        ),
      ],
    );
  }

  void chooseFile() async {
    final directoryPath = await FilePicker.platform.getDirectoryPath();

    if (directoryPath != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => GalleryPage(directoryPath: directoryPath),
        ),
      );
    }
  }
}
