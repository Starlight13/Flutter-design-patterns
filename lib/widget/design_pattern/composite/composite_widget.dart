import 'package:design_patterns/design_pattern/composite/file_hirerarchy.dart';
import 'package:flutter/material.dart';

class CompositeWidget extends StatelessWidget {
  const CompositeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: FileHierarchy.root.length,
      itemBuilder: ((context, index) => FileHierarchy.root[index].render()),
    );
  }
}
