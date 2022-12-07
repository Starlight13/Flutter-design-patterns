import 'package:design_patterns/design_pattern/adapter/blocks/block.dart';

abstract class IBlockAdapter implements IBlock {
  IBlock get adaptedBlock;
}
