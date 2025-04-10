class Car {
  final String name;
  final String description;
  final double fullPrice;
  final double discountPrice;
  final double offPercentage;
  final double stars;
  final int totalVotes;
  final String image;
  final String date;
  final String brand;
  final int year;
  final String timeAgo;
  final String model;

  Car({
    required this.name,
    required this.image,
    required this.timeAgo,
    required this.description,
    required this.fullPrice,
    required this.discountPrice,
    required this.offPercentage,
    required this.stars,
    required this.totalVotes,
    required this.date,
    required this.brand,
    required this.year,
    required this.model,
  });

  // Factory constructor to create a Car object from a map (useful for APIs)
  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      name: json['name'],
      image: json['image'], // Added image
      timeAgo: json['timeAgo'], // Added timeAgo
      description: json['description'],
      fullPrice: (json['fullPrice'] as num).toDouble(),
      discountPrice: (json['discountPrice'] as num).toDouble(),
      offPercentage: (json['offPercentage'] as num).toDouble(),
      stars: (json['stars'] as num).toDouble(),
      totalVotes: json['totalVotes'],
      date: json['date'],
      brand: json['brand'],
      year: json['year'],
      model: json['model'],
    );
  }

  // Convert Car object to JSON (for API calls)
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image, // Added image
      'timeAgo': timeAgo, // Added timeAgo
      'description': description,
      'fullPrice': fullPrice,
      'discountPrice': discountPrice,
      'offPercentage': offPercentage,
      'stars': stars,
      'totalVotes': totalVotes,
      'date': date,
      'brand': brand,
      'year': year,
      'model': model,
    };
  }
}
