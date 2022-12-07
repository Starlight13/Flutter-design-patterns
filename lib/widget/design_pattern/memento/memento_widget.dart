import 'package:design_patterns/design_pattern/memento/memento_box_shape.dart';
import 'package:design_patterns/design_pattern/memento/history.dart';
import 'package:design_patterns/widget/common/my_text_button.dart';
import 'package:flutter/material.dart';

class MementoWidget extends StatefulWidget {
  const MementoWidget({super.key});

  @override
  State<MementoWidget> createState() => _MementoWidgetState();
}

class _MementoWidgetState extends State<MementoWidget> {
  final MementoBoxShape boxShape = MementoBoxShape.initial();
  final History history = History();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: boxShape.height,
                width: boxShape.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: boxShape.color,
                ),
              ),
            ),
          ),
          Column(
            children: [
              const Text('Red'),
              Slider(
                min: 0.0,
                max: 255.0,
                value: boxShape.color.red.toDouble(),
                onChanged: (value) => setState(() {
                  boxShape.color = boxShape.color.withRed(value.toInt());
                }),
                onChangeStart: (value) => history.addSnapshot(
                  boxShape.createSnapshot(),
                ),
              ),
              const Text('Green'),
              Slider(
                min: 0.0,
                max: 255.0,
                value: boxShape.color.green.toDouble(),
                onChanged: (value) => setState(() {
                  boxShape.color = boxShape.color.withGreen(value.toInt());
                }),
                onChangeStart: (value) => history.addSnapshot(
                  boxShape.createSnapshot(),
                ),
              ),
              const Text('Blue'),
              Slider(
                min: 0.0,
                max: 255.0,
                value: boxShape.color.blue.toDouble(),
                onChanged: (value) => setState(() {
                  boxShape.color = boxShape.color.withBlue(value.toInt());
                }),
                onChangeStart: (value) => history.addSnapshot(
                  boxShape.createSnapshot(),
                ),
              ),
              const Text('Height'),
              Slider(
                min: 20.0,
                max: 300.0,
                value: boxShape.height,
                onChanged: (value) => setState(() {
                  boxShape.height = value;
                }),
                onChangeStart: (value) => history.addSnapshot(
                  boxShape.createSnapshot(),
                ),
              ),
              const Text('Width'),
              Slider(
                min: 20.0,
                max: 400.0,
                value: boxShape.width,
                onChanged: (value) => setState(() {
                  boxShape.width = value;
                }),
                onChangeStart: (value) => history.addSnapshot(
                  boxShape.createSnapshot(),
                ),
              ),
              MyTextButton(
                isDisabled: history.isEmpty,
                onTap: () => setState(() {
                  boxShape.restoreFromSnapshot(history.getLastSnapshot);
                }),
                text: 'Undo',
              ),
            ],
          )
        ],
      ),
    );
  }
}
