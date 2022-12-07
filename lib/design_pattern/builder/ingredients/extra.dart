import 'package:design_patterns/design_pattern/builder/ingredients/ingredient.dart';

abstract class Extra extends Ingredient {}

class Olives extends Extra {
  @override
  int get calories => 23;
  @override
  String get name => 'Olives';

  @override
  String get image => 'assets/burger_assets/olive.png';
}

class Tomato extends Extra {
  @override
  int get calories => 14;
  @override
  String get name => 'Tomatoes';

  @override
  String get image => 'assets/burger_assets/tomato.png';
}

class Jalapeno extends Extra {
  @override
  int get calories => 28;
  @override
  String get name => 'Jalapeno';

  @override
  String get image => 'assets/burger_assets/jalapeno.png';
}

class Pickle extends Extra {
  @override
  int get calories => 24;
  @override
  String get name => 'Pickle';

  @override
  String get image => 'assets/burger_assets/pickle.png';
}
