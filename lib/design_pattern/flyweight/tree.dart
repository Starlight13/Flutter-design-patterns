import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class Tree extends CustomPainter {
  final double x;
  final double y;
  final ui.Image sprite;

  Tree({
    required this.x,
    required this.y,
    required this.sprite,
  });

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawImage(sprite, Offset(x, y), Paint());
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
