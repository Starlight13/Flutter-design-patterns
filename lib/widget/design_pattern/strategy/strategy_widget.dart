import 'package:design_patterns/design_pattern/strategy/calculator_context.dart';
import 'package:design_patterns/design_pattern/strategy/strategies/addition_strategy.dart';
import 'package:design_patterns/design_pattern/strategy/strategies/division_strategy.dart';
import 'package:design_patterns/design_pattern/strategy/strategies/multiplication_strategy.dart';
import 'package:design_patterns/design_pattern/strategy/strategies/subtraction_strategy.dart';
import 'package:design_patterns/widget/common/my_text_button.dart';
import 'package:flutter/material.dart';

class StrategyWidget extends StatefulWidget {
  const StrategyWidget({super.key});

  @override
  State<StrategyWidget> createState() => _StrategyWidgetState();
}

class _StrategyWidgetState extends State<StrategyWidget> {
  final calculatorContext = CalculatorContext();
  final _aController = TextEditingController();
  final _bController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 150.0,
                child: TextField(
                  controller: _aController,
                  textAlign: TextAlign.center,
                  onChanged: (value) => setState(() {}),
                  style: const TextStyle(
                    fontSize: 30.0,
                  ),
                ),
              ),
              Text(
                calculatorContext.operationSymbol,
                style: const TextStyle(
                  fontSize: 40.0,
                ),
              ),
              SizedBox(
                width: 150.0,
                child: TextField(
                  controller: _bController,
                  onChanged: (value) => setState(() {}),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 30.0,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MyTextButton(
                onTap: () => setState(() {
                  calculatorContext.strategy = AdditionStrategy();
                }),
                text: '+',
                fontSize: 20.0,
                width: 50.0,
              ),
              MyTextButton(
                onTap: () => setState(() {
                  calculatorContext.strategy = SubtractionStrategy();
                }),
                text: '-',
                fontSize: 20.0,
                width: 50.0,
              ),
              MyTextButton(
                onTap: () => setState(() {
                  calculatorContext.strategy = DivisionStrategy();
                }),
                text: '\u00F7',
                fontSize: 20.0,
                width: 50.0,
              ),
              MyTextButton(
                onTap: () => setState(() {
                  calculatorContext.strategy = MultiplicationStrategy();
                }),
                text: '\u00D7',
                fontSize: 20.0,
                width: 50.0,
              ),
            ],
          ),
          const SizedBox(
            height: 50.0,
          ),
          Text(
            formatResult(calculatorContext.calculate(
                    _aController.text, _bController.text)) ??
                '?',
            style: const TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  String? formatResult(double? result) {
    // ignore: unused_local_variable
    bool isApproximate = false;
    final trailingZerosRegex = RegExp(r'([.]*0+)(?!.*\d)');
    if (result != null) {
      final isApproximate = result.toString().split('.')[1].length > 5;
      return '${isApproximate ? '\u2248' : ''} ${result.toStringAsFixed(5).replaceAll(trailingZerosRegex, '')}';
    }

    return null;
  }
}
