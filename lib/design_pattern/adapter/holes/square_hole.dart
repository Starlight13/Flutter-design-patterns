import 'package:design_patterns/design_pattern/adapter/adapters/block_adapter.dart';
import 'package:design_patterns/design_pattern/adapter/adapters/round_to_square_block_adapter.dart';
import 'package:design_patterns/design_pattern/adapter/blocks/block.dart';
import 'package:design_patterns/design_pattern/adapter/blocks/round_block.dart';
import 'package:design_patterns/design_pattern/adapter/blocks/square_block.dart';
import 'package:design_patterns/design_pattern/adapter/holes/hole.dart';
import 'package:flutter/material.dart';

class SquareHole extends CustomPainter implements IHole<SquareBlock> {
  final double holeSide;
  final Offset center;
  @override
  final List<SquareBlock> fittedBlocks = [];

  SquareHole({
    required this.holeSide,
    Offset? center,
  }) : center = center ?? Offset(holeSide / 2, holeSide / 2);

  @override
  bool canFit(SquareBlock squareBlock) {
    return squareBlock.side <= holeSide;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint();
    paint.color = Colors.black54;
    canvas.drawRect(
      Rect.fromCircle(
        center: center,
        radius: holeSide / 2,
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  @override
  IBlockAdapter? getAdapterForBlock(IBlock? block) {
    if (block is RoundBlock) {
      return RoundToSquareBlockAdapter(roundBlock: block);
    }
    return null;
  }

  @override
  double get side => holeSide;
}
