import 'package:design_patterns/design_pattern/builder/ingredients/ingredient.dart';

abstract class Cheese extends Ingredient {}

class Cheddar extends Cheese {
  @override
  int get calories => 51;

  @override
  String get name => 'Cheddar cheese';

  @override
  String get image => 'assets/burger_assets/cheddar.png';
}

class Gouda extends Cheese {
  @override
  int get calories => 43;

  @override
  String get name => 'Gouda cheese';

  @override
  String get image => 'assets/burger_assets/gouda.png';
}
