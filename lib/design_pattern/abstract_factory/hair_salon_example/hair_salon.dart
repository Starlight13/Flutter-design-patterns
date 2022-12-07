import 'package:design_patterns/design_pattern/abstract_factory/hair_salon_example/abstract_hair_products.dart';
import 'package:design_patterns/design_pattern/abstract_factory/hair_salon_example/hair_products_factory.dart';

class HairSalon {
  final HairProductsFactory factory;
  late final IShampoo shampoo;
  late final IConditioner conditioner;

  HairSalon({required this.factory}) {
    prepareHairProducts();
  }

  void prepareHairProducts() {
    shampoo = factory.createShampoo();
    conditioner = factory.createConditioner();
  }

  void prepareForHaircut() {
    shampoo.wash();
    conditioner.condition();
  }
}
