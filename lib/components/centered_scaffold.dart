import 'package:flutter/material.dart';

class CenteredScaffold extends StatelessWidget {
  const CenteredScaffold({super.key, required this.children, required this.appBar});

  final List<Widget> children;
  final PreferredSizeWidget appBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: children,
          ),
        ],
      ),
    );
  }
}
