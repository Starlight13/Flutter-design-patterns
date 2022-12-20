import 'dart:math';
import 'dart:developer' as dev;
import 'package:design_patterns/design_pattern/flyweight/tree_images.dart';
import 'package:design_patterns/design_pattern/flyweight/tree_type.dart';
import 'package:design_patterns/widget/common/image_loader.dart';
import 'package:flutter/material.dart';

class FlyweightTree extends CustomPainter {
  final double x;
  final double y;
  final TreeType treeType;

  FlyweightTree({
    required this.x,
    required this.y,
    required this.treeType,
  });

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawImage(treeType.sprite, Offset(x, y), Paint());
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  static Widget generateTrees(int treeCount) {
    return FutureBuilder<List<TreeType>>(
      future: _getTreeTypes(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            final treeTypes = snapshot.data!;
            return Stack(
              children: List.generate(treeCount, (index) {
                return CustomPaint(
                  painter: FlyweightTree(
                    x: Random().nextDouble() *
                        MediaQuery.of(context).size.width,
                    y: Random().nextDouble() *
                        MediaQuery.of(context).size.height,
                    treeType: treeTypes[Random().nextInt(treeTypes.length)],
                  ),
                );
              }),
            );
          } else if (snapshot.hasError) {
            dev.log(snapshot.error.toString());
          }
        }
        return const CircularProgressIndicator();
      }),
    );
  }

  static Future<List<TreeType>> _getTreeTypes() async {
    return [
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
  }
}
