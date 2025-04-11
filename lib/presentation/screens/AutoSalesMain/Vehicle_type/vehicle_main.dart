// import 'package:autobazzaar/components/Header.dart';
// import 'package:autobazzaar/components/data_carousel.dart';
import 'package:autobazzaar/components/data_carousel.dart';
import 'package:autobazzaar/components/header.dart';
import 'package:autobazzaar/components/home_carousel.dart';
// import 'package:autobazzaar/components/image_ad.dart';
import 'package:autobazzaar/components/main_filter.dart';
import 'package:autobazzaar/core/theme/colors.dart';
import 'package:autobazzaar/data/models/dummy_data.dart';
import 'package:autobazzaar/presentation/screens/AutoSalesMain/Vehicle_type/components/vehicle_categories.dart';
// import 'package:autobazzaar/presentation/screens/Home/components/top_category.dart';
// import 'package:autobazzaar/presentation/widgets/button.dart';
import 'package:autobazzaar/presentation/widgets/drawers_main.dart';
// import 'package:autobazzaar/presentation/widgets/shortfilter.dart';
import 'package:flutter/material.dart';

class VehicleMain extends StatelessWidget {
  const VehicleMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      drawer: MainDrawer(), // Left side drawer
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150), // Custom height for the header
        child: Container(
          decoration: BoxDecoration(
            color: red,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(25), // Rounded bottom corners
            ),
          ),
          padding: EdgeInsets.only(top: 50, left: 15, right: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Builder(
                    builder:
                        (context) => IconButton(
                          icon: Icon(Icons.menu, color: Colors.white),
                          onPressed: () => Scaffold.of(context).openDrawer(),
                        ),
                  ),
                  Column(
                    children: [
                      Text(
                        "Your location",
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                      Text(
                        "Kuwait",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.filter_list, color: Colors.white),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MainFilter()),
                      );
                      // Filter action
                    },
                  ),
                ],
              ),
              SizedBox(height: 30),
              Container(
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search any Product..",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
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
          VehicleGridPager(),
                    Header(
            title: "Car",
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text("Top User Ads", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          ),
            DataCarousel(carList: carList, show: true,),
          Header(
            title: "Motor Bike",
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text("Top User Ads", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          ),
            DataCarousel(carList: carList, show: true,),
          Header(
            title: "3 Wheeler",
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text("Top User Ads", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          ),
            DataCarousel(carList: carList, show: true,),
        ],
      ),
    );
  }
}
