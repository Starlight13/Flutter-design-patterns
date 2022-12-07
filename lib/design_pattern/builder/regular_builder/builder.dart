import 'package:design_patterns/design_pattern/builder/ingredients/ingredients.dart';

abstract class Builder {
  void addExtra(Extra extra);

  set name(String name);
  set bread(Bun bread);
  set cheese(Cheese cheese);
  set meat(Meat meat);
  set sauce(Sauce sauce);

  void reset();
}
