import 'package:design_patterns/design_pattern/builder/ingredients/ingredient.dart';

abstract class Sauce extends Ingredient {}

class Ketchup extends Sauce {
  @override
  int get calories => 63;

  @override
  String get name => 'Ketchup';

  @override
  String get image => 'assets/burger_assets/ketchup.png';
}

class Mayo extends Sauce {
  @override
  int get calories => 72;

  @override
  String get name => 'Mayo';

  @override
  String get image => 'assets/burger_assets/mayo.png';
}
