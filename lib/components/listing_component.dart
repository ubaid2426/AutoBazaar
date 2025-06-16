import 'package:flutter/material.dart';

class ListingMain extends StatelessWidget {
  final String name;
  final String image;
  const ListingMain({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 225,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          // **Bottom Container (Shadow)**
          Positioned(
            top: 20,
            right: 10,
            child: Transform.rotate(
              angle: -0.08, // Slight tilt for design
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/listing_form/back3.png"),
                    fit: BoxFit.contain, // Changed to cover
                  ),
                ),
              ),
            ),
          ),
          // **Top Container (Main Card)**
          Positioned(
            top: 0,
            left: 10,
            child: _buildCardContainer(
              context: context,
              imagePath:
                  "assets/images/listing_form/back2.png", // Background image
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 60,
                  vertical: 10,
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // **Left Side - Text**
                    Text(
                      name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // SizedBox(height: 40),
                    // **Right Side - Image**
                    Image.asset(
                      image, // Car image
                      width: 150,
                      // height: 50,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
        // ),
      ),
    );
  }

  // **Reusable Card Container Widget**
  Widget _buildCardContainer({
    required String imagePath,
    Widget? child,
    BuildContext? context,
  }) {
    return Transform.rotate(
      angle: -0.08, // Slight tilt for design
      child: Container(
        width: MediaQuery.of(context!).size.width, // Use responsive width
        height: 200,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.contain, // Changed to cover
          ),
        ),
        child: child,
      ),
    );
  }
}
