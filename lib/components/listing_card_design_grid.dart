import 'package:autobazzaar/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ListingCardDesignGrid extends StatelessWidget {
  final bool rateshow;
  final bool timeshow;
  final bool partcondition;
  final bool experience;
  const ListingCardDesignGrid({
    super.key,
    required this.rateshow,
    required this.timeshow,
    required this.partcondition,
    required this.experience,
  });

  final List<Map<String, dynamic>> items = const [
    {
      "images": [
        "assets/images/home/audi_r8.png",
        "assets/images/home/audi_q7.png",
        "assets/images/home/audi_r8_1.png",
      ],
      "badge": "Premium",
      "title": "Almarai Mango Juice, 1.4L",
      "price": "KWD 0.500",
      "description": "Delicious mango juice",
      "oldPrice": "KWD 0.560",
      "timeago": "1 hr ago",
      "stars": 4.5,
      "experience": "3 years",
      "partcondition": "New",
    },
    {
      "images": ["assets/images/home/audi_q7.png"],
      "badge": "📌 ",
      "title": "Red Bull Sugar Free Energy Drink, 250ml",
      "price": "KWD 0.510",
      "description": "Delicious mango juice",
      "oldPrice": null,
      "timeago": "2 hr ago",
      "stars": 4.5,
      "experience": "3 years",
      "partcondition": "Used",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return
    // Scaffold(
    Padding(
      padding: const EdgeInsets.all(12),
      child: GridView.builder(
        itemCount: items.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.65,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemBuilder: (context, index) {
          final item = items[index];
          final images = List<String>.from(item['images']);
          final controller = PageController();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image carousel
              Container(
                decoration: BoxDecoration(
                  color: lightgrey,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(2, 4),
                    ),
                  ],
                ),
                child: SizedBox(
                  height: 120,
                  child: Stack(
                    children: [
                      PageView.builder(
                        controller: controller,
                        itemCount: images.length,
                        itemBuilder: (context, imgIndex) {
                          return Padding(
                            padding: const EdgeInsets.all(12),
                            child: Image.asset(
                              images[imgIndex],
                              height: 50,
                              fit: BoxFit.contain,
                            ),
                          );
                        },
                      ),
                      if (item['badge'] != null)
                        Positioned(
                          top: 8,
                          left: 8,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.yellow[700],
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              item['badge'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),

              // Page indicator
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: SmoothPageIndicator(
                    controller: controller,
                    count: images.length,
                    effect: const WormEffect(
                      dotHeight: 6,
                      dotWidth: 6,
                      spacing: 6,
                      activeDotColor: Colors.black,
                      dotColor: Colors.grey,
                    ),
                  ),
                ),
              ),

              // Title and info
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['title'],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      item['description'],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Text(
                          item['price'],
                          style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(width: 6),
                        if (item['oldPrice'] != null)
                          Text(
                            item['oldPrice'],
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                      ],
                    ),
                    if (experience == true)
                      Text(
                        "Experience: ${item['experience']}",
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                        ),
                      ),
                    if (partcondition == true)
                      Text(
                        "Part Condition: ${item['partcondition']}",
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                        ),
                      ),
                    if (rateshow == true)
                      Row(
                        children: [
                          _buildStarRating(item['stars']),
                          const SizedBox(width: 4),
                          Text(
                            '${item['stars']}/5',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),

                    if (timeshow == true)
                      Text(
                        item['timeago'],
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                        ),
                      ),
                  ],
                ),
              ),

              // const Spacer(),

              // Add button
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 12, bottom: 12),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(1, 2),
                        ),
                      ],
                    ),
                    child: const Icon(Icons.favorite, size: 20),
                  ),
                ),
              ),
            ],
          );
        },
      ),
      // ),
    );
  }

  Widget _buildStarRating(double rating) {
    int fullStars = rating.floor();
    bool hasHalfStar = (rating - fullStars) >= 0.5;

    return Row(
      children: List.generate(5, (index) {
        if (index < fullStars) {
          return const Icon(Icons.star, color: Colors.amber, size: 14);
        } else if (index == fullStars && hasHalfStar) {
          return const Icon(Icons.star_half, color: Colors.amber, size: 14);
        } else {
          return const Icon(Icons.star_border, color: Colors.amber, size: 14);
        }
      }),
    );
  }
}
