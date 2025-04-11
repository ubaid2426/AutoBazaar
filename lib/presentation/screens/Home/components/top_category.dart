import 'package:autobazzaar/core/theme/colors.dart';
// import 'package:autobazzaar/models/vehicle_category.dart';
import 'package:autobazzaar/presentation/screens/AutoSalesMain/Vehicle_type/components/vehicle_categories.dart';
import 'package:autobazzaar/presentation/screens/AutoSalesMain/Vehicle_type/vehicle_main.dart';
// import 'package:autobazzaar/data/models/dummy_data.dart';
import 'package:autobazzaar/presentation/screens/Home/components/vehicle.dart';
import 'package:flutter/material.dart';

class TopCategories extends StatelessWidget {
  final bool showAutoClassified;
  final List<Map<String, String>> categories;
  const TopCategories({
    super.key,
    required this.showAutoClassified,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: redlight, // Main container background
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(50),
          bottom: Radius.circular(50),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(0, -3),
          ),
        ],
      ),
      child: Column(
        children: [
          // padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title Row
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "Top Categories",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.1,
                      color: Colors.black87,
                    ),
                  ),
                ),
                SizedBox(height: 16),

                // GridView for Cards
                Center(
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // 3 Cards in a Row
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 1, // Perfect Square Cards
                    ),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        // onTap: () {
                          onTap:
                          () {
                            final title = categories[index]['title'];
                            Widget? screen;

                            switch (title) {
                              case "Vehicles":
                                screen = const VehicleMain();
                                break;
                              case "Auto \nParts":
                                // screen = const AutoPartsScreen();
                                break;
                              case "Auto \nScraps":
                                // screen = const AutoScrapsScreen();
                                break;
                              case "Accidentals \nAutos":
                                // screen = const AccidentalsAutosScreen();
                                break;
                            }

                            if (screen != null) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => screen!,
                                ),
                              );
                            }
                          },
                        // },
                        child: TeslaStyleCard(
                          title: categories[index]["title"]!,
                          image: categories[index]["image"]!,
                        ),
                      );
                    },
                  ),
                ),

                // SizedBox(height: 10),
              ],
            ),
          ),
          // Conditionally show AutoClassified
          if (showAutoClassified) AutoClassified(),
          //  AutoClassified(),
        ],
      ),
    );
  }
}

class TeslaStyleCard extends StatelessWidget {
  final String title;
  final String image;

  TeslaStyleCard({required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
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
            image,
            height: 50,
            fit: BoxFit.contain,
            // color: Colors.redAccent, // Tesla-style red accent
          ),
          SizedBox(height: 12),

          // Title
          Text(
            title,
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
