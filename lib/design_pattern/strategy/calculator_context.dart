import 'package:design_patterns/design_pattern/strategy/strategies/strategy.dart';

class CalculatorContext {
  IStrategy? _strategy;

  set strategy(IStrategy strategy) => _strategy = strategy;

  double? calculate(String? a, String? b) {
    if (a != null && b != null) {
      return _strategy?.calculate(double.tryParse(a), double.tryParse(b));
    }
    return null;
  }

  String get operationSymbol {
    return _strategy?.operationSymbol ?? '?';
  }
}
