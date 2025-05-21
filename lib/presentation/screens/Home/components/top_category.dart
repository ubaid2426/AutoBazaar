import 'package:autobazzaar/core/theme/colors.dart';
import 'package:autobazzaar/data/models/dummy_data.dart';
import 'package:autobazzaar/presentation/screens/AutoParts/auto_parts.dart';
import 'package:autobazzaar/presentation/screens/AutoSalesMain/Vehicle_type/vehicle_main.dart';
import 'package:autobazzaar/presentation/screens/Auto_Jobs/components/auto_job_detail.dart';
import 'package:autobazzaar/presentation/screens/Home/components/autoclassified_options.dart';
import 'package:flutter/material.dart';

class TopCategories extends StatelessWidget {
  final bool showAutoClassified;
  final List<Map<String, String>> categories;
  final double h1;
  final double h2;
  const TopCategories({
    super.key,
    required this.showAutoClassified,
    required this.categories, required this.h1, required this.h2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: h1,
      decoration: BoxDecoration(
        color: redlight, // Main container background
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
          bottom: Radius.circular(30),
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
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            // padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                  SizedBox(
                    height: h2,
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4, // 3 Cards in a Row
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: .75, // Perfect Square Cards
                      ),
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          // onTap: () {
                          onTap: () {
                            final title = categories[index]['title'];
                            Widget? screen;
                            print(title);
                            switch (title) {
                              case "Vehicles":
                                screen = const VehicleMain();
                                break;
                              case "Auto \nParts":
                                screen = const AutoPartsMain(
                                  title: 'Auto Parts',
                                );
                                break;
                              case "Auto \nClassified":
                                screen = AutoClassifiedOptions(
                                  categories: autoclassifiedoptions,
                                );
                                break;
                              case "Accidentals \nAutos":
                                // screen = const AccidentalsAutosScreen();
                                break;
                              case "Auto Shops":
                                // screen = const AccidentalsAutosScreen();
                                break;
                              case "Auto \n Showroom":
                                screen = const AutoPartsMain(
                                  title: "Auto Showroom",
                                );
                                break;
                              // case "Car":
                              //   screen = const VehicleDetail(
                              //     title: 'All Car Data', rateshow: false, timeshow: true,
                              //   );
                              //   break;
                              case "Auto \n Mechanic":
                                screen = const AutoJobDetail(
                                  title: 'Auto Mechanic',
                                );
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
                            color: true,
                          ),
                        );
                      },
                    ),
                  ),

                  // SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

class TeslaStyleCard extends StatelessWidget {
  final String title;
  final String image;
  final bool color;
  const TeslaStyleCard({
    required this.title,
    required this.image,
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Image Card
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(2, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.all(12),
          child: Image.asset(image, height: 50, fit: BoxFit.contain),
        ),

        const SizedBox(height: 8),

        // Title below card
        Text(
          title,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: color ? white : black, // dark navy blue
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
