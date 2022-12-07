import 'package:design_patterns/design_pattern/builder/ingredients/ingredients.dart';
import 'package:design_patterns/design_pattern/builder/regular_builder/builder.dart';

class Director {
  void buildItalianBLTSandwich(Builder builder) {
    builder.reset();
    builder
      ..bread = White()
      ..cheese = Gouda()
      ..meat = Salami()
      ..sauce = Mayo()
      ..addExtra(Tomato());
  }

  void buildBlackBurger(Builder builder) {
    builder.reset();
    builder
      ..bread = Black()
      ..cheese = Cheddar()
      ..meat = Patty()
      ..sauce = Ketchup()
      ..addExtra(Jalapeno())
      ..addExtra(Tomato())
      ..addExtra(Pickle());
  }
}
