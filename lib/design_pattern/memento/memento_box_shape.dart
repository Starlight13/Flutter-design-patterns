import 'package:flutter/material.dart';

class MementoBoxShape {
  Color color;
  double height;
  double width;

  MementoBoxShape({
    required this.color,
    required this.height,
    required this.width,
  });

  factory MementoBoxShape.initial() => MementoBoxShape(
        color: Colors.deepPurple,
        height: 200,
        width: 200,
      );

  BoxShapeMemento createSnapshot() {
    return BoxShapeMemento(
      color: color,
      height: height,
      width: width,
    );
  }

  void restoreFromSnapshot(BoxShapeMemento? memento) {
    if (memento != null) {
      color = memento._color;
      height = memento._height;
      width = memento._width;
    }
  }
}

class BoxShapeMemento {
  final Color _color;
  final double _height;
  final double _width;

  BoxShapeMemento({
    required Color color,
    required double height,
    required double width,
  })  : _color = color,
        _height = height,
        _width = width;
}
