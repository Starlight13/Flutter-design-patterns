import 'package:design_patterns/design_pattern/adapter/adapters/block_adapter.dart';
import 'package:design_patterns/design_pattern/adapter/blocks/block.dart';
import 'package:design_patterns/design_pattern/adapter/holes/hole.dart';
import 'package:design_patterns/design_pattern/adapter/holes/round_hole.dart';
import 'package:design_patterns/design_pattern/adapter/holes/square_hole.dart';
import 'package:flutter/material.dart';

class AdapterWidget extends StatefulWidget {
  const AdapterWidget({super.key});

  @override
  State<AdapterWidget> createState() => _AdapterWidgetState();
}

class _AdapterWidgetState extends State<AdapterWidget>
    with TickerProviderStateMixin {
  int? selectedBlock;

  final List<IHole> holes = [
    RoundHole(radius: 30.0),
    SquareHole(holeSide: 90.0),
  ];

  final List<IBlock> blocks = generateRandomBlocks(10);

  final List<IBlock> fittedBlocks = [];

  ValueNotifier<IBlockAdapter?> adapter = ValueNotifier(null);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Text('Double tap to remove fitted blocks.'),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: holes.map((hole) {
                  return Expanded(
                    child: Wrap(
                      direction: Axis.vertical,
                      spacing: 10.0,
                      runSpacing: 5.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: hole.fittedBlocks.map(
                        (block) {
                          return SizedBox(
                            width: block.side,
                            height: block.side,
                            child: GestureDetector(
                              onDoubleTap: () => setState(() {
                                hole.fittedBlocks.remove(block);
                                if (block is IBlockAdapter) {
                                  blocks.add(block.adaptedBlock);
                                } else {
                                  blocks.add(block);
                                }
                              }),
                              child: CustomPaint(painter: block),
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: holes.map((hole) {
                return DragTarget<IBlock>(
                  onLeave: (data) {
                    adapter.value = null;
                  },
                  onWillAccept: (block) {
                    if (block != null) {
                      adapter.value = hole.getAdapterForBlock(block);
                      return hole.canFit(adapter.value ?? block);
                    }
                    return false;
                  },
                  builder: (context, candidateData, rejectedData) => SizedBox(
                    width: hole.side,
                    height: hole.side,
                    child: CustomPaint(
                      painter: hole,
                    ),
                  ),
                  onAccept: (block) {
                    setState(() {
                      blocks.remove(block);
                      hole.fittedBlocks.add(adapter.value ?? block);
                    });
                  },
                );
              }).toList(),
            ),
          ),
          Wrap(
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 10.0,
            children: blocks.map((block) {
              return SizedBox(
                width: block.side,
                height: block.side,
                child: Draggable<IBlock>(
                  data: block,
                  feedback: Opacity(
                    opacity: 0.8,
                    child: ValueListenableBuilder(
                      valueListenable: adapter,
                      builder: (context, value, child) {
                        return adapter.value?.adaptedBlock == block
                            ? CustomPaint(painter: adapter.value)
                            : CustomPaint(painter: block);
                      },
                    ),
                  ),
                  childWhenDragging: Container(),
                  child: CustomPaint(painter: block),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
