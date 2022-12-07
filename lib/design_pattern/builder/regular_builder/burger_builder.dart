import 'package:design_patterns/design_pattern/builder/ingredients/ingredients.dart';
import 'package:design_patterns/design_pattern/builder/regular_builder/regular_builder.dart';

class BurgerBuilder implements Builder {
  Burger _burger = Burger();

  @override
  void addExtra(Extra extra) {
    _burger.extras.add(extra);
  }

  @override
  set name(String name) => _burger.name = name;
  @override
  set bread(Bun bread) => _burger.bread = bread;
  @override
  set cheese(Cheese cheese) => _burger.cheese = cheese;
  @override
  set meat(Meat meat) => _burger.meat = meat;
  @override
  set sauce(Sauce sauce) => _burger.sauce = sauce;

  @override
  void reset() {
    _burger = Burger();
  }

  Burger getBurger() {
    final burger = _burger;
    reset();
    return burger;
  }
}
