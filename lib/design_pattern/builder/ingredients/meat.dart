import 'package:design_patterns/design_pattern/builder/ingredients/ingredient.dart';

abstract class Meat extends Ingredient {}

class Patty extends Meat {
  @override
  int get calories => 127;

  @override
  String get name => 'Patty';

  @override
  String get image => 'assets/burger_assets/patty.png';
}

class Salami extends Meat {
  @override
  int get calories => 142;

  @override
  String get name => 'Salami';

  @override
  String get image => 'assets/burger_assets/salami.png';
}
