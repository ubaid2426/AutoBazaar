// import 'package:autobazzaar/components/Header.dart';
// import 'package:autobazzaar/components/data_carousel.dart';
import 'package:autobazzaar/components/app_bar.dart';
// import 'package:autobazzaar/components/custom_appbarsearch.dart';
// import 'package:autobazzaar/components/data_carousel.dart';
import 'package:autobazzaar/components/header.dart';
import 'package:autobazzaar/components/home_carousel.dart';
// import 'package:autobazzaar/components/image_ad.dart';
// import 'package:autobazzaar/components/main_filter.dart';
// import 'package:autobazzaar/core/theme/colors.dart';
import 'package:autobazzaar/data/models/dummy_data.dart';
import 'package:autobazzaar/presentation/screens/AutoSalesMain/Vehicle_type/components/vehicle_categories.dart';
import 'package:autobazzaar/presentation/screens/AutoSalesMain/Vehicle_type/vehicle_detail.dart';
// import 'package:autobazzaar/presentation/screens/Home/components/top_category.dart';
// import 'package:autobazzaar/presentation/widgets/button.dart';
// import 'package:autobazzaar/presentation/widgets/drawers_main.dart';
// import 'package:autobazzaar/presentation/widgets/horizontal_filter.dart';
// import 'package:autobazzaar/presentation/widgets/shortfilter.dart';
// import 'package:autobazzaar/presentation/widgets/shortfilter.dart';
import 'package:flutter/material.dart';

class VehicleMain extends StatefulWidget {
  // final String type;
  const VehicleMain({super.key});

  @override
  State<VehicleMain> createState() => _VehicleMainState();
}

class _VehicleMainState extends State<VehicleMain> {
  String? selectedCategoryName;
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
                  SizedBox(height: 20),
                  PromoCarousel(promoList: promoCards),
                  SizedBox(height: 20),
                  Header(
                    title: "Browse By Auto-types",
                    onViewAll: () {
                      //        Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => ,
                      //     // builder: (context) => const QiblaApp(),
                      //   ),
                      // );
                    },
                  ),
                   SizedBox(height: 20),
                  MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: VehicleGridPager(
                      onCategoryTap: (category) {
                        setState(() {
                          selectedCategoryName = category.name;
                        });
                        Widget? screen;
                        switch (category.name) {
                          case "Car":
                          case "Motor bike":
                          case "Quad/Buggy":
                          case "Water Crafts":
                          case "Taxi":
                          case "3-Wheeler":
                          case "Van":
                          case "Bus":
                          case "Lorry":
                          case "RV/Camper van":
                          case "Other":
                            screen = VehicleDetail(
                              title: '${category.name} data',
                              rateshow: false,
                              timeshow: true,
                              type: selectedCategoryName ?? "Car",
                            );
                            break;
                        }

                        if (screen != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => screen!),
                          );
                        }
                      },

                      page: dummyVehicleCategories,
                      height: 390,
                      count: 4,
                      ratio: 1,
                      svg: false,
                    ),
                  ),
                  // SizedBox(height: 20),
                  // HorizontalFilter(type: selectedCategoryName ?? "Car"),
                  // ShortFilter(),
                  // Header(
                  //   title: "Car",
                  //   onViewAll: () {
                  //     //        Navigator.push(
                  //     //   context,
                  //     //   MaterialPageRoute(
                  //     //     builder: (context) => ,
                  //     //     // builder: (context) => const QiblaApp(),
                  //     //   ),
                  //     // );
                  //   },
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 20),
                  //   child: Text(
                  //     "Top User Ads",
                  //     style: TextStyle(
                  //       fontSize: 18,
                  //       fontWeight: FontWeight.bold,
                  //     ),
                  //   ),
                  // ),
                  // DataCarousel(
                  //   carList: carList,
                  //   show: true,
                  //   shouldShowTilde: false,
                  //   rateshow: false,
                  //   timeshow: true,
                  // ),
                  // Header(
                  //   title: "Motor Bike",
                  //   onViewAll: () {
                  //     //        Navigator.push(
                  //     //   context,
                  //     //   MaterialPageRoute(
                  //     //     builder: (context) => ,
                  //     //     // builder: (context) => const QiblaApp(),
                  //     //   ),
                  //     // );
                  //   },
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 20),
                  //   child: Text(
                  //     "Top User Ads",
                  //     style: TextStyle(
                  //       fontSize: 18,
                  //       fontWeight: FontWeight.bold,
                  //     ),
                  //   ),
                  // ),
                  // DataCarousel(
                  //   carList: carList,
                  //   show: true,
                  //   shouldShowTilde: false,
                  //   rateshow: false,
                  //   timeshow: true,
                  // ),
                  // Header(
                  //   title: "3 Wheeler",
                  //   onViewAll: () {
                  //     //        Navigator.push(
                  //     //   context,
                  //     //   MaterialPageRoute(
                  //     //     builder: (context) => ,
                  //     //     // builder: (context) => const QiblaApp(),
                  //     //   ),
                  //     // );
                  //   },
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 20),
                  //   child: Text(
                  //     "Top User Ads",
                  //     style: TextStyle(
                  //       fontSize: 18,
                  //       fontWeight: FontWeight.bold,
                  //     ),
                  //   ),
                  // ),
                  // DataCarousel(
                  //   carList: carList,
                  //   show: true,
                  //   shouldShowTilde: false,
                  //   rateshow: false,
                  //   timeshow: true,
                  // ),
                ],
              ),
            ]),
          ),
        ],
      ),
      // ),
    );

    // Scaffold(
    //   backgroundColor: white,
    //   drawer: MainDrawer(), // Left side drawer
    //   appBar: CustomSearchAppBar(backarrow: true),
    //   body: ListView(
    //     children: [
    //       SizedBox(height: 20),
    //       PromoCarousel(promoList: promoCards),
    //       SizedBox(height: 20),
    //       Header(
    //         title: "Browse By Auto-types",
    //         onViewAll: () {
    //           //        Navigator.push(
    //           //   context,
    //           //   MaterialPageRoute(
    //           //     builder: (context) => ,
    //           //     // builder: (context) => const QiblaApp(),
    //           //   ),
    //           // );
    //         },
    //       ),
    //       VehicleGridPager(
    //         onCategoryTap: (category) {
    //           setState(() {
    //             selectedCategoryName = category.name;
    //           });
    //           Widget? screen;
    //           switch (category.name) {
    //             case "Car":
    //             case "Motor bike":
    //             case "Quad/Buggy":
    //             case "Water Crafts":
    //             case "Taxi":
    //             case "3-Wheeler":
    //             case "Van":
    //             case "Bus":
    //             case "Lorry":
    //             case "RV/Camper van":
    //             case "Other":
    //               screen = VehicleDetail(
    //                 title: '${category.name} data',
    //                 rateshow: false,
    //                 timeshow: true, type: selectedCategoryName??"Car",
    //               );
    //               break;
    //           }

    //           if (screen != null) {
    //             Navigator.push(
    //               context,
    //               MaterialPageRoute(builder: (context) => screen!),
    //             );
    //           }
    //         },

    //         page: dummyVehicleCategories,
    //         height: 390,
    //         count: 4,
    //         ratio: 1,
    //         svg: false,
    //       ),
    //       SizedBox(height: 20),
    //       HorizontalFilter(type: selectedCategoryName??"Car",),
    //       ShortFilter(),
    //       Header(
    //         title: "Car",
    //         onViewAll: () {
    //           //        Navigator.push(
    //           //   context,
    //           //   MaterialPageRoute(
    //           //     builder: (context) => ,
    //           //     // builder: (context) => const QiblaApp(),
    //           //   ),
    //           // );
    //         },
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.symmetric(horizontal: 20),
    //         child: Text(
    //           "Top User Ads",
    //           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    //         ),
    //       ),
    //       DataCarousel(
    //         carList: carList,
    //         show: true,
    //         shouldShowTilde: false,
    //         rateshow: false,
    //         timeshow: true,
    //       ),
    //       Header(
    //         title: "Motor Bike",
    //         onViewAll: () {
    //           //        Navigator.push(
    //           //   context,
    //           //   MaterialPageRoute(
    //           //     builder: (context) => ,
    //           //     // builder: (context) => const QiblaApp(),
    //           //   ),
    //           // );
    //         },
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.symmetric(horizontal: 20),
    //         child: Text(
    //           "Top User Ads",
    //           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    //         ),
    //       ),
    //       DataCarousel(
    //         carList: carList,
    //         show: true,
    //         shouldShowTilde: false,
    //         rateshow: false,
    //         timeshow: true,
    //       ),
    //       Header(
    //         title: "3 Wheeler",
    //         onViewAll: () {
    //           //        Navigator.push(
    //           //   context,
    //           //   MaterialPageRoute(
    //           //     builder: (context) => ,
    //           //     // builder: (context) => const QiblaApp(),
    //           //   ),
    //           // );
    //         },
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.symmetric(horizontal: 20),
    //         child: Text(
    //           "Top User Ads",
    //           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    //         ),
    //       ),
    //       DataCarousel(
    //         carList: carList,
    //         show: true,
    //         shouldShowTilde: false,
    //         rateshow: false,
    //         timeshow: true,
    //       ),
    //     ],
    //   ),
    // );
  }
}
