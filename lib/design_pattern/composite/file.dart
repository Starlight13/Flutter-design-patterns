import 'package:flutter/material.dart';

abstract class IFile {
  int get size;
  String get title;
  Widget render();
}
