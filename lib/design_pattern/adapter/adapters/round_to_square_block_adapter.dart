import 'package:design_patterns/design_pattern/adapter/adapters/block_adapter.dart';
import 'package:design_patterns/design_pattern/adapter/blocks/block.dart';
import 'package:design_patterns/design_pattern/adapter/blocks/round_block.dart';
import 'package:design_patterns/design_pattern/adapter/blocks/square_block.dart';
import 'package:flutter/painting.dart';

class RoundToSquareBlockAdapter extends SquareBlock implements IBlockAdapter {
  final RoundBlock roundBlock;

  RoundToSquareBlockAdapter({required this.roundBlock})
      : super(
          side: roundBlock.radius * 2,
          center: roundBlock.center,
        );

  @override
  void paint(Canvas canvas, Size size) {
    super.paint(canvas, size);
    roundBlock.paint(canvas, size);
  }

  @override
  IBlock get adaptedBlock => roundBlock;
}
