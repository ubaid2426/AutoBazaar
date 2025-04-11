import 'package:autobazzaar/core/theme/colors.dart';
import 'package:autobazzaar/data/models/dummy_data.dart';
import 'package:autobazzaar/models/vehicle_category.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class VehicleCategory {
//   final String label;
//   final String image;

//   VehicleCategory({required this.label, required this.image});
// }

class VehicleGridPager extends StatefulWidget {
  const VehicleGridPager({super.key});

  @override
  State<VehicleGridPager> createState() => _VehicleGridPagerState();
}

class _VehicleGridPagerState extends State<VehicleGridPager> {
  final PageController _controller = PageController();

  // final List<VehicleCategory> categories = [
  //   VehicleCategory(label: "Car", image: "assets/car.png"),
  //   VehicleCategory(label: "Motor bike", image: "assets/bike.png"),
  //   VehicleCategory(label: "3-Wheeler", image: "assets/threewheeler.png"),
  //   VehicleCategory(label: "Van", image: "assets/van.png"),
  //   VehicleCategory(label: "Taxi", image: "assets/taxi.png"),
  //   VehicleCategory(label: "Bus", image: "assets/bus.png"),
  //   VehicleCategory(label: "Lorry", image: "assets/lorry.png"),
  //   VehicleCategory(label: "Quad/Buggy", image: "assets/quad.png"),
  //   VehicleCategory(label: "RV/Camper van", image: "assets/rv.png"),
  //   // Add more if needed
  // ];

  List<List<VehicleCategory>> get pages {
    const int itemsPerPage = 9; // 3 rows of 3 cards
    List<List<VehicleCategory>> paginated = [];
    for (int i = 0; i < dummyVehicleCategories.length; i += itemsPerPage) {
      paginated.add(dummyVehicleCategories.sublist(
          i,
          (i + itemsPerPage) > dummyVehicleCategories.length
              ? dummyVehicleCategories.length
              : i + itemsPerPage));
    }
    return paginated;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 450, // Adjust based on image/card size
          child: PageView.builder(
            controller: _controller,
            itemCount: pages.length,
            itemBuilder: (context, index) {
              return GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: pages[index].length,
                padding: const EdgeInsets.all(12),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, i) {
                  return _buildCategoryCard(pages[index][i]);
                },
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        SmoothPageIndicator(
          controller: _controller,
          count: pages.length,
          effect: WormEffect(
            activeDotColor: Colors.black,
            dotHeight: 8,
            dotWidth: 8,
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryCard(VehicleCategory category) {
    return Container(
      decoration: BoxDecoration(
        color: white, // Dark Background
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.white54,
            blurRadius: 15,
            spreadRadius: 1,
            offset: Offset(3, 4),
          ),
          BoxShadow(
            color: const Color.fromARGB(255, 120, 118, 118),
            blurRadius: 10,
            offset: Offset(-3, -3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Logo
          Image.asset(
            category.imagePath,
            height: 50,
            fit: BoxFit.contain,
            // color: Colors.redAccent, // Tesla-style red accent
          ),
          SizedBox(height: 12),

          // Title
          Text(
            category.name,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: black,
              letterSpacing: 1.1,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
