import 'package:autobazzaar/components/app_bar.dart';
// import 'package:autobazzaar/components/custom_appbarsearch.dart';
// import 'package:autobazzaar/components/main_filter.dart';
// import 'package:autobazzaar/core/theme/colors.dart';
import 'package:autobazzaar/components/home_carousel.dart';
import 'package:autobazzaar/components/image_ad.dart';
import 'package:autobazzaar/models/showroom_model.dart';
// import 'package:autobazzaar/models/showroom_model.dart';
import 'package:autobazzaar/presentation/screens/Home/Screens/auto_parts.dart';
import 'package:autobazzaar/presentation/screens/Home/Screens/auto_sales.dart';
import 'package:autobazzaar/presentation/screens/Home/components/top_category.dart';
import 'package:autobazzaar/presentation/screens/Home/components/vehicle.dart';
import 'package:autobazzaar/presentation/screens/Showroom/Showroom_ad/popular_showroom.dart';
import 'package:autobazzaar/presentation/widgets/drawers_main.dart';
// import 'package:autobazzaar/presentation/screens/Home/components/vehicle.dart';
// import 'package:autobazzaar/presentation/screens/Showroom/Showroom_ad/popular_showroom.dart';
// import 'package:autobazzaar/presentation/widgets/drawers_main.dart';
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
      drawer: MainDrawer(),
      // appBar: CustomSliverAppBar(),
      body: CustomScrollView(
        // child: Row(
        slivers: [
          const CustomSliverAppBar(location: "Kuwait", backarrow: false),
          SliverList(
            delegate: SliverChildListDelegate([
              // all your other widgets...
              SizedBox(height: 0),
              PromoCarousel(promoList: promoCards),
              SizedBox(height: 10),

              // SizedBox(height: 30),
              TopCategories(
                showAutoClassified: true,
                categories: categories, h1: 320, h2: 260,
              ),
              // Will show it // Base Layer
              // if (showAutoClassified)
              PopularShowrooms(
                showrooms: [
                  Showroom(
                    name: "Al Habib Showroom",
                    logoUrl: "assets/images/showroom/show6.jpeg",
                    rating: 4.5,
                    city: 'Lahore',
                    autoCount: 50,
                  ),
                  Showroom(
                    name: "Faiz Showroom",
                    logoUrl: "assets/images/showroom/show2.png",
                    rating: 4.4,
                    city: 'Lahore',
                    autoCount: 20,
                  ),
                  Showroom(
                    name: "Aseer Time",
                    logoUrl: "assets/images/showroom/show3.png",
                    rating: 4.6,
                    city: 'Islamabad',
                    autoCount: 90,
                  ),
                  Showroom(
                    name: "Little Caesars",
                    logoUrl: "assets/images/showroom/show4.jpeg",
                    rating: 4.56,
                    city: 'Lahore',
                    autoCount: 50,
                  ),
                  Showroom(
                    name: "Auto Shoowroom",
                    logoUrl: "assets/images/showroom/show5.png",
                    rating: 4.56,
                    city: 'Karachi',
                    autoCount: 70,
                  ),
                  Showroom(
                    name: "Al Fajr Showroom",
                    logoUrl: "assets/images/showroom/show1.png",
                    rating: 4.56,
                    city: 'Lahore',
                    autoCount: 150,
                  ),
                  Showroom(
                    name: "Khan Autos",
                    logoUrl: "assets/images/showroom/show7.png",
                    rating: 4.56,
                    city: 'Multan',
                    autoCount: 10,
                  ),
                  Showroom(
                    name: "Naseer Autos",
                    logoUrl: "assets/images/showroom/show8.png",
                    rating: 4.56,
                    city: 'Lahore',
                    autoCount: 50,
                  ),
                  Showroom(
                    name: "Muqadim Autos",
                    logoUrl: "assets/images/showroom/show1.png",
                    rating: 4.56,
                    city: 'Queta',
                    autoCount: 120,
                  ),
                  Showroom(
                    name: "Zero wheels",
                    logoUrl: "assets/images/showroom/show2.png",
                    rating: 4.56,
                    city: 'Lahore',
                    autoCount: 50,
                  ),
                  Showroom(
                    name: "Halal Motors",
                    logoUrl: "assets/images/showroom/show3.png",
                    rating: 4.56,
                    city: 'Rahim Yar Khan',
                    autoCount: 40,
                  ),
                  Showroom(
                    name: "Qaseer Rim",
                    logoUrl: "assets/images/showroom/show8.png",
                    rating: 4.56,
                    city: 'Lahore',
                    autoCount: 50,
                  ),
                ],
              ),
              SizedBox(height: 10),
              // if (showAutoClassified)
              AutoClassified(),
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
            ]),
          ),
        ],
      ),
      // ),
    );
  }
}
