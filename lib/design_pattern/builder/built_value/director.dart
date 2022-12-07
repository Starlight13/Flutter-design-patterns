import 'package:design_patterns/design_pattern/builder/built_value/burger.dart';
import 'package:design_patterns/design_pattern/builder/ingredients/ingredients.dart';

class Director {
  void buildItalianBLTSandwich(BurgerBuilder builder) {
    builder.replace(Burger());
    builder
      ..bread = White()
      ..cheese = Gouda()
      ..meat = Salami()
      ..sauce = Mayo()
      ..extras?.add(Olives())
      ..extras?.add(Tomato());
  }

  void buildBlackBurger(BurgerBuilder builder) {
    builder.replace(Burger());
    builder
      ..bread = Black()
      ..cheese = Cheddar()
      ..meat = Patty()
      ..sauce = Ketchup()
      ..extras?.add(Jalapeno())
      ..extras?.add(Tomato())
      ..extras?.add(Pickle());
  }
}
