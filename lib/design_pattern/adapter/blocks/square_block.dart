import 'package:design_patterns/design_pattern/adapter/blocks/block.dart';
import 'package:flutter/material.dart';

class SquareBlock extends CustomPainter implements IBlock {
  @override
  final double side;
  final Offset center;
  @override
  final Color color;

  SquareBlock({required this.side, Offset? center, Color? color})
      : center = center ?? Offset(side / 2, side / 2),
        color = color ?? Colors.teal;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint();
    paint.color = color;
    final rect = Rect.fromCircle(
      center: center,
      radius: side / 2,
    );
    canvas.drawRect(
      rect,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }

  @override
  SquareBlock copyWith({double? size, Offset? center, Color? color}) {
    if (size != null) {
      center = Offset(size / 2, size / 2);
    }
    return SquareBlock(
      side: size ?? side,
      center: center ?? this.center,
      color: color ?? this.color,
    );
  }
}
