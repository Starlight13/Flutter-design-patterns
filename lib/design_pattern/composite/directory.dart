import 'package:design_patterns/design_pattern/composite/file.dart';
import 'package:flutter/material.dart';

class Directory implements IFile {
  final String _title;
  late final List<IFile> _children;

  Directory({required String title, List<IFile>? children}) : _title = title {
    if (children != null) {
      _children = children;
    } else {
      _children = [];
    }
  }

  void add(IFile child) {
    _children.add(child);
  }

  void remove(IFile child) {
    _children.remove(child);
  }

  @override
  Widget render() {
    return ExpansionTile(
      leading: const Icon(Icons.folder),
      title: Text('$title ($size KB)'),
      children: _children.map((e) => e.render()).toList(),
    );
  }

  @override
  int get size => _children.fold(
      0, (previousValue, element) => previousValue + element.size);

  @override
  String get title => _title;
}
