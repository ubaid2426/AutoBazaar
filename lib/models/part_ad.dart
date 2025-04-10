class Part {
  final String name;
  final String description;
  final double fullPrice;
  final double stars;
  final int totalVotes;
  final String image;
  final String date;
  final String brand;
  final int year;
  final String model;

  Part({
    required this.name,
    required this.image,
    required this.description,
    required this.fullPrice,
    required this.stars,
    required this.totalVotes,
    required this.date,
    required this.brand,
    required this.year,
    required this.model,
  });

  // Factory constructor to create a Car object from a map (useful for APIs)
  factory Part.fromJson(Map<String, dynamic> json) {
    return Part(
      name: json['name'],
      image: json['image'], // Added image
      description: json['description'],
      fullPrice: (json['fullPrice'] as num).toDouble(),
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
      'description': description,
      'fullPrice': fullPrice,
      'stars': stars,
      'totalVotes': totalVotes,
      'date': date,
      'brand': brand,
      'year': year,
      'model': model,
    };
  }
}
