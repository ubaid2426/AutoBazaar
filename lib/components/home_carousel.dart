import 'package:autobazzaar/models/promo_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:autobazzaar/core/dummy_data.dart'; // Import your dummy data

class PromoCarousel extends StatefulWidget {
  final List<PromoCardModel> promoList; // Accepts a list of promo items

  const PromoCarousel({super.key, required this.promoList});

  @override
  State<PromoCarousel> createState() => _PromoCarouselState();
}

class _PromoCarouselState extends State<PromoCarousel> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: CarouselSlider(
            options: CarouselOptions(
              height: 200,
              autoPlay: true,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
               items: widget.promoList.map((promo) {
              return promoCard(promo.imagePath, promo.discount, promo.id);
            }).toList(),
          ),
        ),
        SizedBox(height: 10),
        Center(
          child: AnimatedSmoothIndicator(
            activeIndex: currentIndex,
            count: widget.promoList.length, // Uses the passed list count
            effect: ExpandingDotsEffect(
              dotHeight: 8,
              dotWidth: 8,
              activeDotColor: Colors.red,
              dotColor: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }

      Widget promoCard(String image, String discount, String colorvarient) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red[900],
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.all(10),
      height: 150, // Ensure enough height for layout
      child: Stack(
        children: [
          Positioned(
            bottom: -30, // Adjust position as needed
            right: 0, // Adjust position as needed
            child: Image.asset(image, height: 200, fit: BoxFit.cover),
          ),
          // Text and button section
          Positioned(
            top: 0,
            left: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  discount,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Now in (product)\n$colorvarient colour variants",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(146, 255, 255, 255),
                    foregroundColor: Colors.red[900],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {},
                  child: Text("Shop Now →"),
                ),
              ],
            ),
          ),

          // Car image positioned at the bottom-right
        ],
      ),
    );
  }

}
