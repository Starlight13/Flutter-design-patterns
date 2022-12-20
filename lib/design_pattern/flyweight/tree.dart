import 'dart:math';
import 'dart:developer' as dev;
import 'dart:ui' as ui;
import 'package:design_patterns/design_pattern/flyweight/tree_images.dart';
import 'package:design_patterns/widget/common/image_loader.dart';
import 'package:flutter/material.dart';

class Tree extends CustomPainter {
  final double x;
  final double y;
  final ui.Image sprite;

  Tree({
    required this.x,
    required this.y,
    required this.sprite,
  });

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawImage(sprite, Offset(x, y), Paint());
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  static List<Widget> generateTrees(int treeCount) {
    return List.generate(treeCount, (index) {
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
}
