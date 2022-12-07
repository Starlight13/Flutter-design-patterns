import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class ImageWithTitle extends CustomPainter {
  final ui.Image image;
  final String title;

  ImageWithTitle({required this.image, required this.title});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawImage(image, const Offset(0, 60.0), Paint());
    final TextPainter textPainter = TextPainter(
        text:
            TextSpan(text: title, style: const TextStyle(color: Colors.purple)),
        textAlign: TextAlign.justify,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 20);
    textPainter.paint(canvas, const Offset(20.0, 300.0));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
