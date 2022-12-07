import 'package:design_patterns/design_pattern/abstract_factory/hair_salon_example/abstract_hair_products.dart';

abstract class HairProductsFactory {
  IShampoo createShampoo();
  IConditioner createConditioner();
}
