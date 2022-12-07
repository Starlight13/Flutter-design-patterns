class Product {
  final String name;
  final String imageName;
  final double originalPrice;
  double? discount;

  Product({
    required this.name,
    required this.imageName,
    required this.originalPrice,
  });

  double get price => originalPrice - originalPrice * (discount ?? 0);

  bool get isDiscounted => discount != null;
}
