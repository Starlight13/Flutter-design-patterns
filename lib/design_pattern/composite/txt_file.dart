import 'package:design_patterns/design_pattern/composite/file.dart';
import 'package:flutter/material.dart';

class TxtFile implements IFile {
  @override
  final int size;

  @override
  final String title;

  TxtFile({required this.size, required this.title});

  @override
  Widget render() {
    return ListTile(
      leading: const Icon(Icons.file_open),
      title: Text('$title.txt ($size KB)'),
    );
  }
}
