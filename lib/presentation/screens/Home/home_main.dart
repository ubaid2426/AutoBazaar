import 'package:autobazzaar/components/main_filter.dart';
import 'package:autobazzaar/core/theme/colors.dart';
import 'package:autobazzaar/components/home_carousel.dart';
import 'package:autobazzaar/components/image_ad.dart';
import 'package:autobazzaar/models/showroom_model.dart';
import 'package:autobazzaar/presentation/screens/Home/Screens/auto_parts.dart';
import 'package:autobazzaar/presentation/screens/Home/Screens/auto_sales.dart';
import 'package:autobazzaar/presentation/screens/Home/components/top_category.dart';
import 'package:autobazzaar/presentation/screens/Home/components/vehicle.dart';
import 'package:autobazzaar/presentation/screens/Showroom/Showroom_ad/popular_showroom.dart';
import 'package:autobazzaar/presentation/widgets/drawers_main.dart';
// import 'package:autobazzaar/screens/Home/components/vehicle.dart';
// import 'package:autobazzaar/screens/Home/components/vehicle.dart';
import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../data/models/dummy_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0; // Track index
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
          PopularShowrooms(
            showrooms: [
              Showroom(
                name: "Al Habib Showroom",
                logoUrl: "assets/images/showroom/show6.jpeg",
                rating: 4.5, city: 'Lahore', autoCount: 50,
              ),
              Showroom(
                name: "Faiz Showroom",
                logoUrl: "assets/images/showroom/show2.png",
                rating: 4.4, city: 'Lahore', autoCount: 20,
              ),
              Showroom(
                name: "Aseer Time",
                logoUrl: "assets/images/showroom/show3.png",
                rating: 4.6, city:  'Islamabad', autoCount: 90,
              ),
              Showroom(
                name: "Little Caesars",
                logoUrl: "assets/images/showroom/show4.jpeg",
                rating: 4.56, city: 'Lahore', autoCount: 50,
              ),
              Showroom(
                name: "Auto Shoowroom",
                logoUrl: "assets/images/showroom/show5.png",
                rating: 4.56, city: 'Karachi', autoCount: 70,
              ),
              Showroom(
                name: "Al Fajr Showroom",
                logoUrl: "assets/images/showroom/show1.png",
                rating: 4.56, city: 'Lahore', autoCount: 150,
              ),
              Showroom(
                name: "Khan Autos",
                logoUrl: "assets/images/showroom/show7.png",
                rating: 4.56, city: 'Multan', autoCount: 10,
              ),
              Showroom(
                name: "Naseer Autos",
                logoUrl: "assets/images/showroom/show8.png",
                rating: 4.56, city: 'Lahore', autoCount: 50,
              ),
              Showroom(
                name: "Muqadim Autos",
                logoUrl: "assets/images/showroom/show1.png",
                rating: 4.56, city: 'Queta', autoCount: 120,
              ),
              Showroom(
                name: "Zero wheels",
                logoUrl: "assets/images/showroom/show2.png",
                rating: 4.56, city: 'Lahore', autoCount: 50,
              ),
              Showroom(
                name: "Halal Motors",
                logoUrl: "assets/images/showroom/show3.png",
                rating: 4.56, city: 'Rahim Yar Khan', autoCount: 40,
              ),
              Showroom(
                name: "Qaseer Rim",
                logoUrl: "assets/images/showroom/show8.png",
                rating: 4.56, city: 'Lahore', autoCount: 50,
              ),
            ],
          ),
          SizedBox(height: 30),
          TopCategories(
            showAutoClassified: true,
            categories: categories,
          ), // Will show it // Base Layer
          // PromoCarousel(promoList: promoCards),
          SizedBox(height: 10),
          ImageDisplay(
            imagePath: 'assets/images/image_ad/vehicle.png',
            width: double.infinity,
            height: 400,
          ),
          AutoPart(),
          ImageDisplay(
            imagePath: 'assets/images/image_ad/parts.png',
            width: double.infinity,
            height: 400,
          ),
          AutoSales(title: 'Accidental Autos', carList: carList),
          ImageDisplay(
            imagePath: 'assets/images/image_ad/parts.png',
            width: double.infinity,
            height: 400,
          ),
        ],
      ),
    );
  }
}
