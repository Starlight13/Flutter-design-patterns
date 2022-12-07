import 'dart:math';

import 'package:design_patterns/design_pattern/adapter/blocks/block.dart';
import 'package:flutter/material.dart';

class RoundBlock extends CustomPainter implements IBlock {
  final double radius;
  final Offset center;
  @override
  final Color color;

  RoundBlock({required this.radius, Offset? center, Color? color})
      : center = center ?? Offset(radius, radius),
        color = color ?? Colors.purple;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint();
    paint.color = color;
    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }

  @override
  double get side => radius * 2;

  @override
  RoundBlock copyWith({double? size, Offset? center, Color? color}) {
    double? radius;
    if (size != null) {
      radius = size * sqrt(2) / 2;
      center = Offset(radius, radius);
    }
    return RoundBlock(
      radius: radius ?? this.radius,
      center: center ?? this.center,
      color: color ?? this.color,
    );
  }
}
