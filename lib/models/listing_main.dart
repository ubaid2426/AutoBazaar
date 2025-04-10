class Listing {
  final String title;
  final String category;
  final String imageUrl;
  final String status;
  final double price;
  final double originalPrice;
  final double discount;
  final int reviews;
  final double rating;
  final DateTime dateAdded;

  Listing({
    required this.title,
    required this.category,
    required this.imageUrl,
    required this.status,
    required this.price,
    required this.originalPrice,
    required this.discount,
    required this.reviews,
    required this.rating,
    required this.dateAdded,
  });
}