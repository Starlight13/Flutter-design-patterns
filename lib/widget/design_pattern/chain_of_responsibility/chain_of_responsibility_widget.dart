import 'package:design_patterns/design_pattern/chain_of_responsibility/cuteness_handler.dart';
import 'package:design_patterns/design_pattern/chain_of_responsibility/danger_handler.dart';
import 'package:design_patterns/design_pattern/chain_of_responsibility/decision_maker.dart';
import 'package:design_patterns/design_pattern/chain_of_responsibility/dog.dart';
import 'package:design_patterns/design_pattern/chain_of_responsibility/owner_handler.dart';
import 'package:design_patterns/design_pattern/chain_of_responsibility/pet_request.dart';
import 'package:flutter/material.dart';

class ChainOfResponsibilityWidget extends StatefulWidget {
  const ChainOfResponsibilityWidget({super.key});

  @override
  State<ChainOfResponsibilityWidget> createState() =>
      _ChainOfResponsibilityWidgetState();
}

class _ChainOfResponsibilityWidgetState
    extends State<ChainOfResponsibilityWidget> {
  late final DecisionMaker decisionMaker;
  late final Dog dog;

  bool ignoreDanger = false;
  bool ignoreCuteness = false;

  @override
  void initState() {
    super.initState();
    decisionMaker = DecisionMaker(handlers: [
      OwnerHandler(),
      CutenessHandler(),
      DangerHandler(),
    ]);
    dog = Dog();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'To pet or not to pet?',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset('assets/dog_assets/dog.png'),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.purple.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Has owner?'),
                          Switch(
                            value: dog.isPet,
                            onChanged: (value) => setState(() {
                              dog.isPet = value;
                            }),
                          )
                        ],
                      ),
                      Text('Cuteness: ${dog.cuteness}'),
                      Slider(
                        value: dog.cuteness.toDouble(),
                        max: 5,
                        onChanged: (value) => setState(() {
                          dog.cuteness = value.toInt();
                        }),
                        label: 'Cuteness',
                      ),
                      Text('Danger level: ${dog.dangerLevel}'),
                      Slider(
                        max: 5,
                        value: dog.dangerLevel.toDouble(),
                        onChanged: (value) => setState(() {
                          dog.dangerLevel = value.toInt();
                        }),
                        label: 'Danger level',
                      ),
                      TextButton(
                        onPressed: () => setState(() {
                          decisionMaker.makeDecision(
                            PetRequest(
                              dog: dog,
                              ignoreCuteness: ignoreCuteness,
                              ignoreDanger: ignoreDanger,
                            ),
                          );
                        }),
                        child: const Text('Make decision'),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  const Text('Ignore cuteness?'),
                  Switch(
                    value: ignoreCuteness,
                    onChanged: (value) => setState(() {
                      ignoreCuteness = value;
                    }),
                  )
                ],
              ),
              Row(
                children: [
                  const Text('Ignore danger?'),
                  Switch(
                    value: ignoreDanger,
                    onChanged: (value) => setState(() {
                      ignoreDanger = value;
                    }),
                  )
                ],
              )
            ],
          ),
          Expanded(
            child: decisionMaker.render(),
          ),
        ],
      ),
    );
  }
}
