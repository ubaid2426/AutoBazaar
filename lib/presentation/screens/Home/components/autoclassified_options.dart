import 'package:autobazzaar/components/app_bar.dart';
// import 'package:autobazzaar/components/custom_appbarsearch.dart';
import 'package:autobazzaar/components/home_carousel.dart';
// import 'package:autobazzaar/core/theme/colors.dart';
import 'package:autobazzaar/data/models/dummy_data.dart';
import 'package:autobazzaar/presentation/screens/AutoParts/auto_parts.dart';
// import 'package:autobazzaar/presentation/screens/AutoParts/components/autopart_car.dart';
// import 'package:autobazzaar/presentation/screens/AutoSalesMain/Vehicle_type/components/vehicle_categories.dart';
// import 'package:autobazzaar/presentation/screens/AutoSalesMain/Vehicle_type/vehicle_main.dart';
import 'package:autobazzaar/presentation/screens/AutoSalesMain/autosalesmain.dart';
import 'package:autobazzaar/presentation/screens/AutoWanted/auto_wanted_main.dart';
// import 'package:autobazzaar/presentation/screens/Auto_Jobs/auto_job_main.dart';
import 'package:autobazzaar/presentation/screens/Auto_Jobs/autojob_main.dart';
import 'package:autobazzaar/presentation/screens/Auto_Jobs/components/auto_job_detail.dart';
import 'package:autobazzaar/presentation/screens/Auto_Rental/auto_rental_main.dart';
import 'package:autobazzaar/presentation/screens/Home/components/top_category.dart';
// import 'package:autobazzaar/presentation/screens/PostScreens/Main_Category/Auto_Wanted/auto_wanted.dart';
// import 'package:autobazzaar/presentation/screens/Home/components/top_category.dart';
import 'package:flutter/material.dart';

class AutoClassifiedOptions extends StatelessWidget {
  final List<Map<String, String>> categories;
  const AutoClassifiedOptions({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomSliverAppBar(),
      body: CustomScrollView(
        // child: Row(
        slivers: [
          const CustomSliverAppBar(location: "Kuwait", backarrow: true),
          SliverList(
            delegate: SliverChildListDelegate([
              // all your other widgets...
              Column(
                children: [
                  PromoCarousel(promoList: promoCards),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title Row
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "Auto Classified Options",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.1,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        // SizedBox(height: 16),
                        // GridView for Cards
                        GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4, // 3 Cards in a Row
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                childAspectRatio: .7, // Perfect Square Cards
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
                                  case "Auto \nSales":
                                    screen = const AutoSalesMain();
                                    break;
                                  case "Auto Shop \nService":
                                    screen = const AutoPartsMain(
                                      title: "Auto Shop & Service",
                                    );
                                    break;
                                  case "Auto \nWanted":
                                    screen = const AutoWantedMain();
                                    break;
                                  case "Auto \nRental":
                                    screen = const AutoRentalMain();
                                    break;
                                  case "Auto \nJobs":
                                    screen = const AutojobMain();
                                    break;
                                  case "Auto \nMechanic":
                                    screen = const AutoJobDetail(
                                      title: 'Auto Mechanic',
                                    );
                                    break;
                                  case " Mechanical \n Engineer":
                                    screen = const AutoJobDetail(
                                      title: 'Auto Mechanic',
                                    );
                                    break;
                                  case "Body Shop \nTechnician":
                                    screen = const AutoJobDetail(
                                      title: 'Auto Mechanic',
                                    );
                                    break;
                                  case "EV \nTechnician":
                                    screen = const AutoJobDetail(
                                      title: 'Auto Mechanic',
                                    );
                                    break;
                                  case "Rental \nAgent":
                                    screen = const AutoJobDetail(
                                      title: 'Auto Mechanic',
                                    );
                                    break;
                                  case "Tire \nTechnician":
                                    screen = const AutoJobDetail(
                                      title: 'Auto Mechanic',
                                    );
                                    break;
                                  case "Quality \nControl \nInspector":
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
                                color: false,
                              ),
                            );
                          },
                        ),

                        // SizedBox(height: 10),
                      ],
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ],
      ),
      // ),
    );
  }
}
