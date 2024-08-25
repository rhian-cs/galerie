import 'package:flutter/material.dart';

class GalerieAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GalerieAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Text('Galerie'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
