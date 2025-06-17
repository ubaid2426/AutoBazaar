
import 'dart:convert';
import 'package:autobazzaar/components/app_bar.dart';
import 'package:autobazzaar/core/theme/colors.dart';
// import 'package:autobazzaar/presentation/screens/AutoParts/auto_parts_sub_category.dart';
import 'package:autobazzaar/presentation/screens/AutoParts/components/autopart_subcategory.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:autobazzaar/components/home_carousel.dart';
import 'package:autobazzaar/data/models/dummy_data.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AutopartForm extends StatelessWidget {
  final String autotype;
 final String name;
 final String namesub;
  const AutopartForm({super.key, required this.autotype, required this.name, required this.namesub});

  Future<Map<String, dynamic>> _loadAutoPartsData() async {
    final String path = 'assets/json/auto_parts/car/car_data.json'; // Adjust path if needed
    final String jsonStr = await rootBundle.loadString(path);
    final Map<String, dynamic> decoded = json.decode(jsonStr);
    print(decoded);
    return decoded;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Auto Part Main Category"), backgroundColor: red,),
      body: CustomScrollView(
        slivers: [
          // const CustomSliverAppBar(location: "Kuwait", backarrow: true),
          SliverList(
            delegate: SliverChildListDelegate([
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // PromoCarousel(promoList: promoCards),
                  // const SizedBox(height: 20),
                  // const Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 16.0),
                  //   child: Text(
                  //     "Browse Auto Parts Categories",
                  //     style: TextStyle(
                  //       fontSize: 22,
                  //       fontWeight: FontWeight.bold,
                  //       letterSpacing: 1.1,
                  //       color: Colors.black87,
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(height: 10),
                  FutureBuilder<Map<String, dynamic>>(
                    future: _loadAutoPartsData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (!snapshot.hasData || snapshot.hasError) {
                        return const Center(child: Text("Failed to load data"));
                      }

                      final data = snapshot.data!;
                      final categories = data.keys.toList();

                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: categories.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 0.85,
                          ),
                          itemBuilder: (context, index) {
                            final category = categories[index];
                            final iconPath = "assets/images/icon/${category.replaceAll(" ", "_").toLowerCase()}.svg";

                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => AutoPartsSubCategory(
                                      autotype: autotype,
                                      category: category, ispost: true, name: name, namesub: namesub,
                                    ),
                                  ),
                                );
                              },
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: lightgrey,
                                      borderRadius: BorderRadius.circular(16),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.05),
                                          blurRadius: 6,
                                          offset: const Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    child: SvgPicture.asset(
                                      iconPath,
                                      width: 60,
                                      height: 60,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    category,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black87,
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
