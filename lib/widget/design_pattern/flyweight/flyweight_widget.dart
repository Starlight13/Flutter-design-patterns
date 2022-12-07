import 'dart:math';
import 'dart:developer' as dev;

import 'package:design_patterns/design_pattern/flyweight/flyweight_tree.dart';
import 'package:design_patterns/design_pattern/flyweight/tree.dart';
import 'package:design_patterns/design_pattern/flyweight/tree_images.dart';
import 'package:design_patterns/design_pattern/flyweight/tree_type.dart';
import 'package:design_patterns/widget/common/image_loader.dart';
import 'package:flutter/material.dart';

class FlyweightWidget extends StatefulWidget {
  const FlyweightWidget({super.key});

  @override
  State<FlyweightWidget> createState() => _FlyweightWidgetState();
}

class _FlyweightWidgetState extends State<FlyweightWidget> {
  late final List<Widget> trees;
  bool isUsingFlyweight = true;

  List<Widget> regularTrees() {
    return List.generate(10000, (index) {
      return FutureBuilder(
          future: ImageLoader.loadImage(
              imageAssetPath: TreeImages.randomAssetPath(),
              width: 10,
              height: 10),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.data != null) {
              return CustomPaint(
                painter: Tree(
                  x: Random().nextDouble() * MediaQuery.of(context).size.width,
                  y: Random().nextDouble() * MediaQuery.of(context).size.height,
                  sprite: snapshot.data!,
                ),
              );
            } else if (snapshot.hasError) {
              dev.log(snapshot.error.toString());
            }
            return Container();
          });
    });
  }

  Future<List<Widget>> flyweightTrees() async {
    final treeTypes = [
      TreeType(
        name: 'smallTree',
        sprite: await ImageLoader.loadImage(
          imageAssetPath: TreeImages.smallTree,
          height: 10,
          width: 10,
        ),
      ),
      TreeType(
        name: 'pineTree',
        sprite: await ImageLoader.loadImage(
          imageAssetPath: TreeImages.pineTree,
          height: 10,
          width: 10,
        ),
      ),
      TreeType(
        name: 'bushyTree',
        sprite: await ImageLoader.loadImage(
          imageAssetPath: TreeImages.bushyTree,
          height: 10,
          width: 10,
        ),
      ),
      TreeType(
        name: 'adultTree',
        sprite: await ImageLoader.loadImage(
          imageAssetPath: TreeImages.adultTreeAsset,
          height: 10,
          width: 10,
        ),
      ),
    ];
    return List.generate(10000, (index) {
      return CustomPaint(
        painter: FlyweightTree(
          x: Random().nextDouble() * MediaQuery.of(context).size.width,
          y: Random().nextDouble() * MediaQuery.of(context).size.height,
          treeType: treeTypes[Random().nextInt(treeTypes.length)],
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
  }

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
          FutureBuilder(
            future: flyweightTrees(),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return Stack(
                    children: [
                      ...snapshot.data!,
                    ],
                  );
                } else if (snapshot.hasError) {
                  dev.log(snapshot.error.toString());
                }
              }
              return const CircularProgressIndicator();
            }),
          )
        else
          Stack(
            children: regularTrees(),
          )
      ],
    );
  }
}
