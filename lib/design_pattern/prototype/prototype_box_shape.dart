import 'dart:math';

import 'package:design_patterns/design_pattern/prototype/prototype.dart';
import 'package:flutter/material.dart';

class PrototypeBoxShape implements IPrototype<PrototypeBoxShape> {
  Color color;
  double height;
  double width;

  PrototypeBoxShape({
    required this.color,
    required this.height,
    required this.width,
  });

  factory PrototypeBoxShape.initial() => PrototypeBoxShape(
        color: Colors.deepPurple,
        height: 100,
        width: 100,
      );

  factory PrototypeBoxShape.clone(PrototypeBoxShape source) =>
      PrototypeBoxShape(
        color: source.color,
        height: source.height,
        width: source.width,
      );

  void randomizeProperties() {
    color = Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    height = Random().nextDouble() * 200 + 20;
    width = Random().nextDouble() * 200 + 20;
  }

  @override
  PrototypeBoxShape clone() {
    return PrototypeBoxShape.clone(this);
  }
}
