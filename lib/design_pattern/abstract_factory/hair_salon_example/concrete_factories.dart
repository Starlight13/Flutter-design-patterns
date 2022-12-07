import 'package:design_patterns/design_pattern/abstract_factory/hair_salon_example/abstract_hair_products.dart';
import 'package:design_patterns/design_pattern/abstract_factory/hair_salon_example/concrete_hair_products.dart';
import 'package:design_patterns/design_pattern/abstract_factory/hair_salon_example/hair_products_factory.dart';

class LorealFactory implements HairProductsFactory {
  @override
  IConditioner createConditioner() {
    return LorealConditioner();
  }

  @override
  IShampoo createShampoo() {
    return LorealShampoo();
  }
}

class SchwarzkopfFactory implements HairProductsFactory {
  @override
  IConditioner createConditioner() {
    return SchwarzkopfConditioner();
  }

  @override
  IShampoo createShampoo() {
    return SchwarzkopfShampoo();
  }
}
