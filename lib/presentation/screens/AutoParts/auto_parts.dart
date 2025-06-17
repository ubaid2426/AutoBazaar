import 'package:autobazzaar/components/app_bar.dart';
// import 'package:autobazzaar/components/custom_appbarsearch.dart';
import 'package:autobazzaar/components/home_carousel.dart';
// import 'package:autobazzaar/core/theme/colors.dart';
import 'package:autobazzaar/data/models/dummy_data.dart';
import 'package:autobazzaar/presentation/screens/AutoParts/components/autopart_car.dart';
import 'package:autobazzaar/presentation/screens/AutoSalesMain/Vehicle_type/components/vehicle_categories.dart';
import 'package:autobazzaar/presentation/screens/AutoShop_Service/auto_shop_service_main.dart';
// import 'package:autobazzaar/presentation/screens/Home/components/top_category.dart';
import 'package:flutter/material.dart';

class AutoPartsMain extends StatelessWidget {
  final String title;
  const AutoPartsMain({super.key, required this.title});
  // final String name;
  // final String namesub;
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
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title Row
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "$title Categories",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.1,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        SizedBox(height: 16),

                        MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: VehicleGridPager(
                            onCategoryTap: (category) {
                              Widget? screen;
                              if (title == "Auto Parts") {
                                switch (category.name) {
                                  case "Car":
                                  case "Taxi":
                                  case "Motor bike":
                                  case "Van":
                                  case "3-Wheeler":
                                  case "Bus":
                                  case "Lorry":
                                  case "Quad/Buggy":
                                  case "RV/Camper van":
                                  case "Water Crafts":
                                    screen = AutopartCar(
                                    autotype: category.name,
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
                              } else if (title == "Auto Shop & Service") {
                                switch (category.name) {
                                  case "Car":
                                  case "Taxi":
                                  case "Motor bike":
                                  case "Van":
                                  case "3-Wheeler":
                                  case "Bus":
                                  case "Lorry":
                                  case "Quad/Buggy":
                                  case "RV/Camper van":
                                  case "Water Crafts":
                                    screen = AutoServiceSubCategory(
                                      autotype: category.name,
                                      // selectedVehicleType: category.name,
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
                              }
                            },

                            page: dummyVehicleCategories,
                            height: 440,
                            count: 4,
                            ratio: .82,
                            svg: false,
                          ),
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
    // Scaffold(
    //   appBar: CustomSearchAppBar(backarrow: true),
    //   body: SingleChildScrollView(
    //     child: Column(
    //       children: [
    //         PromoCarousel(promoList: promoCards),
    //         SizedBox(height: 20),
    //         Padding(
    //           padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               // Title Row
    //               Padding(
    //                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
    //                 child: Text(
    //                   "$title Categories",
    //                   style: TextStyle(
    //                     fontSize: 22,
    //                     fontWeight: FontWeight.bold,
    //                     letterSpacing: 1.1,
    //                     color: Colors.black87,
    //                   ),
    //                 ),
    //               ),
    //               SizedBox(height: 16),

    //               VehicleGridPager(
    //                 onCategoryTap: (category) {
    //                   Widget? screen;
    //                   if (title == "Auto Parts") {
    //                     switch (category.name) {
    //                       case "Car":
    //                       case "Taxi":
    //                       case "Motor bike":
    //                       case "Van":
    //                       case "3-Wheeler":
    //                       case "Bus":
    //                       case "Lorry":
    //                       case "Quad/Buggy":
    //                       case "RV/Camper van":
    //                       case "Water Crafts":
    //                         screen = AutopartCar(
    //                           selectedVehicleType: category.name,
    //                         );
    //                         break;
    //                     }

    //                     if (screen != null) {
    //                       Navigator.push(
    //                         context,
    //                         MaterialPageRoute(builder: (context) => screen!),
    //                       );
    //                     }
    //                   } else if (title == "Auto Shop & Service") {
    //                     switch (category.name) {
    //                       case "Car":
    //                       case "Taxi":
    //                       case "Motor bike":
    //                       case "Van":
    //                       case "3-Wheeler":
    //                       case "Bus":
    //                       case "Lorry":
    //                       case "Quad/Buggy":
    //                       case "RV/Camper van":
    //                       case "Water Crafts":
    //                         screen = AutoServiceSubCategory(autotype: category.name,
    //                           // selectedVehicleType: category.name,
    //                         );
    //                         break;
    //                     }
    //                     if (screen != null) {
    //                       Navigator.push(
    //                         context,
    //                         MaterialPageRoute(builder: (context) => screen!),
    //                       );
    //                     }
    //                   }
    //                 },

    //                 page: dummyVehicleCategories,
    //                 height: 440,
    //                 count: 4,
    //                 ratio: .82, svg: false,
    //               ),

    //               // SizedBox(height: 10),
    //             ],
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
