import 'package:design_patterns/design_pattern/composite/txt_file.dart';
import 'package:flutter/material.dart';

class Pic extends TxtFile {
  Pic({required super.size, required super.title});

  @override
  Widget render() {
    return ListTile(
      leading: const Icon(Icons.image),
      title: Text('$title.jpg ($size KB)'),
    );
  }
}
