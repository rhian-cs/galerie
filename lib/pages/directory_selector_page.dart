import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:galerie/components/galerie_app_bar.dart';
import 'package:galerie/pages/gallery_page.dart';

class DirectorySelectorPage extends StatelessWidget {
  const DirectorySelectorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GalerieAppBar(),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: () => chooseFile(context),
                child: const Text('Choose a directory'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void chooseFile(BuildContext context) {
    FilePicker.platform.getDirectoryPath().then((directoryPath) {
      if (directoryPath == null) return;

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => GalleryPage(directoryPath: directoryPath),
        ),
      );
    });
  }
}
