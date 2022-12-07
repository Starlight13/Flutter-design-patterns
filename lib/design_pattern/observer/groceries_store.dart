import 'package:design_patterns/design_pattern/observer/groceries_store_newsletter.dart';
import 'package:design_patterns/design_pattern/observer/product.dart';

class GroceriesStore {
  final newsletter = GroceriesStoreNewsletter();
  final List<Product> _products = [
    Product(
      name: 'Cabbage',
      imageName: 'assets/groceries_assets/cabbage.png',
      originalPrice: 30.0,
    ),
    Product(
      name: 'Carrot',
      imageName: 'assets/groceries_assets/carrot.png',
      originalPrice: 24.0,
    ),
    Product(
      name: 'Onion',
      imageName: 'assets/groceries_assets/onion.png',
      originalPrice: 20.0,
    ),
  ];

  List<Product> get products => _products;

  void _discount(Product product, double discount) {
    product.discount = discount;
    newsletter.notifySubscribers(
      '${product.name} is now only ${product.price}',
    );
  }

  void _removeDiscount(Product product) {
    product.discount = null;
    newsletter.notifySubscribers(
      'The discount for ${product.name} has ended',
    );
  }

  void discountAction(Product product, {double? discount}) {
    if (product.isDiscounted) {
      _removeDiscount(product);
    } else {
      _discount(product, discount ?? 0.1);
    }
  }
}
