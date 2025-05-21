class Product {
  final String title;
  final String description;
  final String image;
  final double price;
  final bool isPremium;

  Product({
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    this.isPremium = false,
  });
}
