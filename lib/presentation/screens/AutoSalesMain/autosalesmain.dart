import 'package:autobazzaar/components/Header.dart';
import 'package:autobazzaar/components/home_carousel.dart';
// import 'package:autobazzaar/components/image_ad.dart';
import 'package:autobazzaar/components/main_filter.dart';
import 'package:autobazzaar/core/theme/colors.dart';
import 'package:autobazzaar/data/models/dummy_data.dart';
import 'package:autobazzaar/presentation/screens/Home/components/top_category.dart';
import 'package:autobazzaar/presentation/widgets/button.dart';
import 'package:autobazzaar/presentation/widgets/drawers_main.dart';
import 'package:autobazzaar/presentation/widgets/shortfilter.dart';
import 'package:flutter/material.dart';

class AutoSalesMain extends StatelessWidget {
  const AutoSalesMain({super.key});

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
          TopCategories(
            showAutoClassified: false,
            categories: autosalecategories,
          ), // Will hide it
          // PromoCarousel(promoList: promoCards),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 80,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 10,
                      children: [
                        FilterButton(title: 'Conditions'),
                        FilterButton(title: 'Car Make'),
                        FilterButton(title: 'Models'),
                        FilterButton(title: 'Trim'),
                        FilterButton(title: 'Year'),
                        FilterButton(title: 'Kilometer'),
                        FilterButton(title: 'Body Type'),
                        FilterButton(title: 'Number of Seats'),
                        FilterButton(title: 'Fuels'),
                        FilterButton(title: 'Transmission'),
                        FilterButton(title: 'Engine Size cc'),
                        FilterButton(title: 'Battery Capacity'),
                        FilterButton(title: 'Battery Range'),
                        FilterButton(title: 'Exterior Color'),
                        FilterButton(title: 'Interior Color'),
                        FilterButton(title: 'Interior Options'),
                        FilterButton(title: 'Exterior Options'),
                        FilterButton(title: 'Technology Options'),
                        FilterButton(title: 'Regional Specs'),
                        FilterButton(title: 'Car Region'),
                        FilterButton(title: 'Car License'),
                        FilterButton(title: 'Insurance'),
                        FilterButton(title: 'Car Custom'),
                        FilterButton(title: 'Body Condition'),
                        FilterButton(title: 'Paint'),
                        FilterButton(title: 'Payment Method'),
                        FilterButton(title: 'Listing Type'),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 50,
                  height: 50,
                  child: Container(
                    decoration: BoxDecoration(
                      // color: redlight, // Main container background
                      border: Border.all(color: red),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10),
                        bottom: Radius.circular(10),
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
                    child: Icon(Icons.filter_alt_sharp),
                  ),
                ),
              ],
            ),
          ),
          ShortFilter(),
          Header(
            title: "Vehicle",
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
        ],
      ),
    );
  }
}
