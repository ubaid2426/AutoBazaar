import 'package:flutter/material.dart';
import 'package:autobazzaar/components/Header.dart';
import 'package:autobazzaar/components/data_carousel.dart';
import 'package:autobazzaar/components/home_carousel.dart';
import 'package:autobazzaar/core/theme/colors.dart';
import 'package:autobazzaar/data/models/dummy_data.dart';
import 'package:autobazzaar/presentation/screens/Home/components/top_category.dart';
// import 'package:autobazzaar/presentation/widgets/drawers_main.dart';

class AutoSalesMain extends StatelessWidget {
  const AutoSalesMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      // drawer: MainDrawer(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: red,
            floating: true,
            snap: true,
            expandedHeight: 140,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 40),
                        Column(
                          children: const [
                            Text(
                              "Your location",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
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
                          icon: const Icon(
                            Icons.filter_list,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            // Navigate to filter screen
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Container(
                      height: 44,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Row(
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
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(height: 20),
              PromoCarousel(promoList: promoCards),
              const SizedBox(height: 10),
              TopCategories(
                showAutoClassified: false,
                categories: autosalecategories, h1: 200, h2: 160,
              ),
              const SizedBox(height: 10),
              Header(title: "Vehicle", onViewAll: () {}),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Top User Ads",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              DataCarousel(
                carList: carList,
                show: true,
                shouldShowTilde: false,
                rateshow: false,
                timeshow: true,
              ),
              Header(title: "Auto Parts", onViewAll: () {}),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Top User Ads",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              DataCarousel(
                carList: carList,
                show: true,
                shouldShowTilde: false,
                rateshow: false,
                timeshow: true,
              ),
              Header(title: "Accidental Autos", onViewAll: () {}),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Top User Ads",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              DataCarousel(
                carList: carList,
                show: true,
                shouldShowTilde: false,
                rateshow: false,
                timeshow: true,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
