import 'package:design_patterns/design_pattern/abstract_factory/hair_salon_example/abstract_hair_products.dart';

class LorealShampoo implements IShampoo {
  @override
  void wash() {
    print('washed with Loreal shampoo');
  }
}

class LorealConditioner implements IConditioner {
  @override
  void condition() {
    print('conditioned with Loreal conditioner');
  }
}

class SchwarzkopfShampoo implements IShampoo {
  @override
  void wash() {
    print('washed with Schwarzkopf shampoo');
  }
}

class SchwarzkopfConditioner implements IConditioner {
  @override
  void condition() {
    print('conditioned with Schwarzkopf conditioner');
  }
}
