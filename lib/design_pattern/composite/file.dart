import 'package:flutter/material.dart';

abstract class IFile {
  int get size;
  String get title;
  Widget render();
}

class File implements IFile {
  @override
  final int size;

  @override
  final String title;

  File({required this.size, required this.title});

  @override
  Widget render() {
    return ListTile(
      leading: const Icon(Icons.file_open),
      title: Text('$title.txt ($size KB)'),
    );
  }
}
