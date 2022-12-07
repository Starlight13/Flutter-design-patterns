import 'package:design_patterns/design_pattern/flyweight/tree_type.dart';
import 'package:flutter/material.dart';

class FlyweightTree extends CustomPainter {
  final double x;
  final double y;
  final TreeType treeType;

  FlyweightTree({
    required this.x,
    required this.y,
    required this.treeType,
  });

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawImage(treeType.sprite, Offset(x, y), Paint());
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
