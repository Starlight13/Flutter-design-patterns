import 'package:design_patterns/design_pattern/flyweight/flyweight_tree.dart';
import 'package:design_patterns/design_pattern/flyweight/tree.dart';
import 'package:flutter/material.dart';

class FlyweightWidget extends StatefulWidget {
  const FlyweightWidget({super.key});

  @override
  State<FlyweightWidget> createState() => _FlyweightWidgetState();
}

class _FlyweightWidgetState extends State<FlyweightWidget> {
  late final List<Widget> trees;
  bool isUsingFlyweight = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text('Flyweight'),
            Switch(
              value: isUsingFlyweight,
              onChanged: (value) => setState(() {
                isUsingFlyweight = value;
              }),
            ),
          ],
        ),
        if (isUsingFlyweight)
          FlyweightTree.generateTrees(5000)
        else
          Stack(
            children: Tree.generateTrees(5000),
          )
      ],
    );
  }
}
