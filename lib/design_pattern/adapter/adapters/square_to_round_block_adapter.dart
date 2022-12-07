import 'dart:math';

import 'package:design_patterns/design_pattern/adapter/adapters/block_adapter.dart';
import 'package:design_patterns/design_pattern/adapter/blocks/block.dart';
import 'package:design_patterns/design_pattern/adapter/blocks/round_block.dart';
import 'package:design_patterns/design_pattern/adapter/blocks/square_block.dart';
import 'package:flutter/painting.dart';

class SquareToRoundBlockAdapter extends RoundBlock implements IBlockAdapter {
  final SquareBlock squareBlock;

  SquareToRoundBlockAdapter({required this.squareBlock})
      : super(radius: squareBlock.side * sqrt(2) / 2);

  @override
  void paint(Canvas canvas, Size size) {
    super.paint(canvas, size);
    squareBlock.copyWith(center: super.center).paint(canvas, size);
  }

  @override
  IBlock get adaptedBlock => squareBlock;
}
