import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:autobazzaar/components/app_bar.dart';
import 'package:autobazzaar/components/home_carousel.dart';
import 'package:autobazzaar/core/theme/colors.dart';
import 'package:autobazzaar/data/models/dummy_data.dart';
import 'package:autobazzaar/presentation/screens/AutoShop_Service/auto_shop_service_sub_options.dart';

class AutoServiceSubCategoryView extends StatelessWidget {
  final String autotype;
  final String selectedCategory;

  const AutoServiceSubCategoryView({
    super.key,
    required this.autotype,
    required this.selectedCategory,
  });

  Future<Map<String, dynamic>> loadSubCategoryData() async {
    final assetPath = 'assets/json/auto_services/auto_service_car.json';
    final String jsonString = await rootBundle.loadString(assetPath);
    final decoded = json.decode(jsonString);
    final selectedData = decoded[autotype] ?? {};
    return selectedData[selectedCategory] ?? {}; // Subcategories of selected main category
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const CustomSliverAppBar(location: "Kuwait", backarrow: true),
          SliverList(
            delegate: SliverChildListDelegate([
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PromoCarousel(promoList: promoCards),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "Browse By Sub Categories",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.1,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  FutureBuilder<Map<String, dynamic>>(
                    future: loadSubCategoryData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError || snapshot.data == null || snapshot.data!.isEmpty) {
                        return const Center(child: Text("No subcategories found."));
                      }

                      final subCategories = snapshot.data!;
                      final subCategoryNames = subCategories.keys.toList();

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: subCategoryNames.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5,
                            childAspectRatio: 0.7,
                          ),
                          itemBuilder: (context, index) {
                            final subCategoryName = subCategoryNames[index];
                            final subItems = subCategories[subCategoryName];

                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => AutoShopServiceSubOptions(
                                      title: subCategoryName,
                                      items: subItems,
                                    ),
                                  ),
                                );
                              },
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: lightgrey,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.05),
                                          blurRadius: 8,
                                          offset: const Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    padding: const EdgeInsets.all(15),
                                    child: SvgPicture.asset(
                                      'assets/icons/${subCategoryName.replaceAll(" ", "_").toLowerCase()}.svg',
                                      height: 60,
                                      width: 60,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    subCategoryName,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF1A1A1A),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
