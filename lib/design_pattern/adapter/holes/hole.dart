import 'package:design_patterns/design_pattern/adapter/adapters/block_adapter.dart';
import 'package:design_patterns/design_pattern/adapter/blocks/block.dart';
import 'package:flutter/material.dart';

abstract class IHole<T extends IBlock> extends CustomPainter {
  double get side;
  bool canFit(T block);
  IBlockAdapter? getAdapterForBlock(IBlock? block);
  List<T> get fittedBlocks;
}
