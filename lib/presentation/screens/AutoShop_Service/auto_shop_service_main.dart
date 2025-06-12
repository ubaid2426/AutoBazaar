import 'dart:convert';
import 'package:autobazzaar/components/app_bar.dart';
import 'package:autobazzaar/core/theme/colors.dart';
import 'package:autobazzaar/presentation/screens/AutoShop_Service/auto_shop_service_sub.dart';
// import 'package:autobazzaar/presentation/screens/AutoShop_Service/auto_shop_service_sub_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:autobazzaar/components/home_carousel.dart';
import 'package:autobazzaar/data/models/dummy_data.dart';
import 'package:flutter_svg/svg.dart';

class AutoServiceSubCategory extends StatelessWidget {
  final String autotype;

  const AutoServiceSubCategory({super.key, required this.autotype});

  Future<Map<String, dynamic>> loadCategoryData(String type) async {
    final assetPath = 'assets/json/auto_services/auto_service_car.json';
    // 'assets/json/auto_services/${type.toLowerCase()}_services.json';
    final String jsonString = await rootBundle.loadString(assetPath);
    final decoded = json.decode(jsonString);
    print(decoded);
    return decoded[type] ?? {}; // Return only the selected type section
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
                children: [
                  PromoCarousel(promoList: promoCards),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "Browse By Categories",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.1,
                        // color: owhite,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  FutureBuilder<Map<String, dynamic>>(
                    future: loadCategoryData(autotype),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError || snapshot.data == null) {
                        return const Center(
                          child: Text("Failed to load categories"),
                        );
                      }

                      final categories = snapshot.data!;
                      final categoryNames = categories.keys.toList();

                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 0,
                        ),
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: categoryNames.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5,
                                childAspectRatio: 1,
                              ),
                          itemBuilder: (context, index) {
                            final categoryName = categoryNames[index];
                            final subCategories = categories[categoryName];

                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (_) => AutoServiceSubCategoryView(
                                          autotype: autotype,
                                          selectedCategory:
                                              categoryName, ispost: false, // the clicked main category
                                          // title: categoryName,
                                          // items: subCategories,
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
                                    // padding: const EdgeInsets.all(15),
                                    child: SvgPicture.asset(
                                      "assets/images/icon/${categoryName.replaceAll(" ", "_").toLowerCase()}.svg", //   height: 60,
                                      width: 60,
                                      fit: BoxFit.contain,
                                    ),
                                    // child: SvgPicture.asset(
                                    //   'assets/images/icon/accessories.svg',
                                    //   // 'assets/images/Icons/${categoryName.replaceAll(" ", "_").toLowerCase()}.svg',
                                    //   height: 60,
                                    //   width: 60,
                                    //   fit: BoxFit.cover,
                                    // ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    categoryName,
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
