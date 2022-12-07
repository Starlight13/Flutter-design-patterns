import 'package:design_patterns/design_pattern/strategy/strategies/strategy.dart';

class DivisionStrategy implements IStrategy {
  @override
  double? calculate(double? a, double? b) {
    if (a != null && b != null) {
      return a / b;
    }
    return null;
  }

  @override
  String get operationSymbol => '\u00F7';
}
