import 'package:flutter/material.dart';

class GalleryColumnSlider extends StatefulWidget {
  final int columnCount;
  final Function(int) onChange;

  const GalleryColumnSlider({super.key, required this.columnCount, required this.onChange});

  @override
  State<GalleryColumnSlider> createState() => _GalleryColumnSliderState();
}

class _GalleryColumnSliderState extends State<GalleryColumnSlider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Columns'),
        Row(
          children: [
            Text(widget.columnCount.toString()),
            Expanded(
              child: Slider(
                min: 1,
                max: 12,
                value: widget.columnCount.toDouble(),
                onChanged: (value) => widget.onChange(value.toInt()),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
