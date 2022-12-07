import 'package:flutter/material.dart';

abstract class Ingredient {
  String get name;
  int get calories;
  String get image;

  Widget render() {
    return Image.asset(image);
  }

  @override
  bool operator ==(other) => other.runtimeType == runtimeType;

  @override
  int get hashCode => Object.hash(runtimeType, name);
}
