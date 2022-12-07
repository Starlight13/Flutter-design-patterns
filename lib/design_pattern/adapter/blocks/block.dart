import 'dart:math';

import 'package:design_patterns/design_pattern/adapter/blocks/round_block.dart';
import 'package:design_patterns/design_pattern/adapter/blocks/square_block.dart';
import 'package:flutter/material.dart';

abstract class IBlock extends CustomPainter {
  double get side;
  Color get color;
  IBlock copyWith({double? size, Offset? center, Color? color});
}

List<IBlock> generateRandomBlocks(int numberOfBlocks) {
  final blockPool = [
    RoundBlock(radius: 0.0),
    SquareBlock(side: 0.0),
  ];

  final List<IBlock> generatedBlocks = [];

  for (int i = 0; i < numberOfBlocks; i++) {
    generatedBlocks.add(
      blockPool[Random().nextInt(blockPool.length)].copyWith(
        size: Random().nextInt(40).toDouble() + 20.0,
      ),
    );
  }

  return generatedBlocks;
}
