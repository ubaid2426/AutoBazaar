import 'package:autobazzaar/components/custom_appbarsearch.dart';
import 'package:autobazzaar/components/home_carousel.dart';
import 'package:autobazzaar/core/theme/colors.dart';
import 'package:autobazzaar/data/models/dummy_data.dart';
import 'package:autobazzaar/presentation/screens/Home/components/top_category.dart';
import 'package:flutter/material.dart';

class AutojobMain extends StatelessWidget {
  const AutojobMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar:CustomSearchAppBar(backarrow: true,),
      body: ListView(
        children: [
          SizedBox(height: 20),
          PromoCarousel(promoList: promoCards),
          SizedBox(height: 10),
          TopCategories(
            showAutoClassified: false,
            categories: autojob, h1: 200, h2: 140,
          ), 
          // PromoCarousel(promoList: promoCards),
          // SizedBox(height: 10),
          // TopCategories(
          //   showAutoClassified: false,
          //   categories: autojobcategories,
          // ),
        ],
      ),
    );
  }
}