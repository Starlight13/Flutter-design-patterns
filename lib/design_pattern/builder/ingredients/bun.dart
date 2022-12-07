import 'package:design_patterns/design_pattern/builder/ingredients/ingredient.dart';
import 'package:flutter/material.dart';

abstract class Bun extends Ingredient {
  String get bottomImage;
  Widget renderBottom() {
    return Image(image: AssetImage(bottomImage));
  }
}

class White extends Bun {
  @override
  int get calories => 38;
  @override
  String get name => 'White bun';

  @override
  String get image => 'assets/burger_assets/whiteBunTop.png';

  @override
  String get bottomImage => 'assets/burger_assets/whiteBunBottom.png';
}

class Black extends Bun {
  @override
  int get calories => 40;
  @override
  String get name => 'Honey Oat';

  @override
  String get bottomImage => 'assets/burger_assets/blackBunBottom.png';

  @override
  String get image => 'assets/burger_assets/blackBunTop.png';
}
