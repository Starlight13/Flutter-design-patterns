import 'package:design_patterns/design_pattern/adapter/adapters/block_adapter.dart';
import 'package:design_patterns/design_pattern/adapter/adapters/square_to_round_block_adapter.dart';
import 'package:design_patterns/design_pattern/adapter/blocks/block.dart';
import 'package:design_patterns/design_pattern/adapter/blocks/round_block.dart';
import 'package:design_patterns/design_pattern/adapter/blocks/square_block.dart';
import 'package:design_patterns/design_pattern/adapter/holes/hole.dart';
import 'package:flutter/material.dart';

class RoundHole extends CustomPainter implements IHole<RoundBlock> {
  final double radius;
  final Offset center;
  @override
  final List<RoundBlock> fittedBlocks = [];

  RoundHole({
    required this.radius,
    Offset? center,
  }) : center = center ?? Offset(radius, radius);

  @override
  bool canFit(RoundBlock roundBlock) {
    return roundBlock.radius <= radius;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint();
    paint.color = Colors.black54;
    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  @override
  IBlockAdapter? getAdapterForBlock(IBlock? block) {
    if (block is SquareBlock) {
      return SquareToRoundBlockAdapter(squareBlock: block);
    }
    return null;
  }

  @override
  double get side => radius * 2;
}
