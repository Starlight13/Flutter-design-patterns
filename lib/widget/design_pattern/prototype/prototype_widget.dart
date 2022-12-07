import 'package:design_patterns/design_pattern/prototype/prototype_box_shape.dart';
import 'package:design_patterns/widget/common/my_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class PrototypeWidget extends StatefulWidget {
  const PrototypeWidget({super.key});

  @override
  State<PrototypeWidget> createState() => _PrototypeWidgetState();
}

class _PrototypeWidgetState extends State<PrototypeWidget> {
  final PrototypeBoxShape boxShape = PrototypeBoxShape.initial();
  final List<PrototypeBoxShape> clones = [];

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 1,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  color: boxShape.color,
                  height: boxShape.height,
                  width: boxShape.width,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MyTextButton(
                      onTap: () async {
                        setState(() {
                          clones.add(boxShape.clone());
                        });
                        SchedulerBinding.instance.addPostFrameCallback(
                          (_) {
                            if (scrollController.hasClients) {
                              final position =
                                  scrollController.position.maxScrollExtent;
                              scrollController.animateTo(
                                position,
                                duration: const Duration(
                                  milliseconds: 200,
                                ),
                                curve: Curves.easeIn,
                              );
                            }
                          },
                        );
                      },
                      text: 'Clone',
                    ),
                    MyTextButton(
                      onTap: () => setState(() {
                        boxShape.randomizeProperties();
                      }),
                      text: 'Randomize properties',
                    ),
                    MyTextButton(
                      onTap: () => setState(() {
                        clones.clear();
                      }),
                      text: 'Clear cloned',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const Text(
          'Cloned containers',
          style: TextStyle(fontSize: 20.0),
        ),
        Flexible(
            child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            controller: scrollController,
            children: [
              const SizedBox(
                height: 10.0,
              ),
              Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                children: clones
                    .map(
                      (e) => Container(
                        color: e.color,
                        height: e.height,
                        width: e.width,
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ))
      ],
    );
  }
}
