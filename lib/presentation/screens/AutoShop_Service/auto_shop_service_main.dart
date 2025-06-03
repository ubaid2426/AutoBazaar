import 'dart:convert';
import 'package:autobazzaar/components/app_bar.dart';
import 'package:autobazzaar/core/theme/colors.dart';
import 'package:autobazzaar/presentation/screens/AutoShop_Service/auto_shop_service_sub_options.dart';
// import 'package:autobazzaar/presentation/screens/PostScreens/Main_Category/Shop_Service/auto_service_sub_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:autobazzaar/components/custom_appbarsearch.dart';
import 'package:autobazzaar/components/home_carousel.dart';
import 'package:autobazzaar/data/models/dummy_data.dart';
// import 'package:autobazzaar/models/vehicle_category.dart';
// import 'package:autobazzaar/presentation/screens/AutoSalesMain/Vehicle_type/components/vehicle_categories.dart';
import 'package:flutter_svg/svg.dart';

class AutoServiceSubCategory extends StatelessWidget {
  final String autotype;

  const AutoServiceSubCategory({super.key, required this.autotype});

  Future<Map<String, dynamic>> loadSubCategoryData() async {
    final assetPath = 'assets/json/auto_services/auto_service_list.json';
    final String jsonString = await rootBundle.loadString(assetPath);
    return json.decode(jsonString);
  }

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
                  PromoCarousel(promoList: promoCards),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "Browse By Categories",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.1,
                            color: Colors.black87,
                          ),
                        ),
                      ),

                      // const SizedBox(height: 16),
                      MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: FutureBuilder<Map<String, dynamic>>(
                          future: loadSubCategoryData(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (snapshot.hasError ||
                                snapshot.data == null) {
                              return const Center(
                                child: Text("Failed to load categories"),
                              );
                            }

                            final data = snapshot.data!;
                            final keys = data.keys.toList();

                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 20,
                              ),
                              child: GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: keys.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4,
                                      crossAxisSpacing: 5,
                                      mainAxisSpacing: 5,
                                      childAspectRatio: 0.55,
                                    ),
                                itemBuilder: (context, index) {
                                  final key = keys[index];
                                  final imagePath = data[key]['image'] ?? '';
                                  final items = List<String>.from(
                                    data[key]['items'] ?? [],
                                  );

                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (_) => AutoShopServiceSubOptions(
                                                title: key,
                                                items: items,
                                              ),
                                        ),
                                      );
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: lightgrey,
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withOpacity(
                                                  0.05,
                                                ),
                                                blurRadius: 8,
                                                offset: const Offset(0, 4),
                                              ),
                                            ],
                                          ),
                                          padding: const EdgeInsets.all(15),
                                          child:
                                              imagePath.isNotEmpty
                                                  ? SvgPicture.asset(
                                                    imagePath,
                                                    height: 60,
                                                    width: 60,
                                                    fit: BoxFit.cover,
                                                  )
                                                  : const SizedBox.shrink(),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          key,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF1A1A1A),
                                          ),
                                        ),
                                        // TextAlign.center
                                      ],
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
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
    //   appBar: CustomSearchAppBar(backarrow: true),
    //   body: SingleChildScrollView(
    //     child: Column(
    //       children: [
    //         PromoCarousel(promoList: promoCards),
    //         const SizedBox(height: 20),
    //         Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             const Padding(
    //               padding: EdgeInsets.symmetric(horizontal: 8.0),
    //               child: Text(
    //                 "Browse By Categories",
    //                 style: TextStyle(
    //                   fontSize: 22,
    //                   fontWeight: FontWeight.bold,
    //                   letterSpacing: 1.1,
    //                   color: Colors.black87,
    //                 ),
    //               ),
    //             ),
    //             const SizedBox(height: 16),

    //             FutureBuilder<Map<String, dynamic>>(
    //               future: loadSubCategoryData(),
    //               builder: (context, snapshot) {
    //                 if (snapshot.connectionState == ConnectionState.waiting) {
    //                   return const Center(child: CircularProgressIndicator());
    //                 } else if (snapshot.hasError || snapshot.data == null) {
    //                   return const Center(
    //                     child: Text("Failed to load categories"),
    //                   );
    //                 }

    //                 final data = snapshot.data!;
    //                 final keys = data.keys.toList();

    //                 return Padding(
    //                   padding: const EdgeInsets.symmetric(
    //                     horizontal: 16,
    //                     vertical: 20,
    //                   ),
    //                   child: GridView.builder(
    //                     physics: const NeverScrollableScrollPhysics(),
    //                     shrinkWrap: true,
    //                     itemCount: keys.length,
    //                     gridDelegate:
    //                         const SliverGridDelegateWithFixedCrossAxisCount(
    //                           crossAxisCount: 4,
    //                           crossAxisSpacing: 5,
    //                           mainAxisSpacing: 5,
    //                           childAspectRatio: 0.55,
    //                         ),
    //                     itemBuilder: (context, index) {
    //                       final key = keys[index];
    //                       final imagePath = data[key]['image'] ?? '';
    //                       final items = List<String>.from(
    //                         data[key]['items'] ?? [],
    //                       );

    //                       return GestureDetector(
    //                         onTap: () {
    //                           Navigator.push(
    //                             context,
    //                             MaterialPageRoute(
    //                               builder:
    //                                   (_) => AutoShopServiceSubOptions(
    //                                     title: key,
    //                                     items: items,
    //                                   ),
    //                             ),
    //                           );
    //                         },
    //                         child: Column(
    //                           children: [
    //                             Container(
    //                               decoration: BoxDecoration(
    //                                 color: lightgrey,
    //                                 borderRadius: BorderRadius.circular(20),
    //                                 boxShadow: [
    //                                   BoxShadow(
    //                                     color: Colors.black.withOpacity(0.05),
    //                                     blurRadius: 8,
    //                                     offset: const Offset(0, 4),
    //                                   ),
    //                                 ],
    //                               ),
    //                               padding: const EdgeInsets.all(15),
    //                               child:
    //                                   imagePath.isNotEmpty
    //                                       ? SvgPicture.asset(
    //                                         imagePath,
    //                                         height: 60,
    //                                         width: 60,
    //                                         fit: BoxFit.cover,
    //                                       )
    //                                       : const SizedBox.shrink(),
    //                             ),
    //                             const SizedBox(height: 8),
    //                             Text(
    //                               key,
    //                               textAlign: TextAlign.center,
    //                               style: const TextStyle(
    //                                 fontSize: 14,
    //                                 fontWeight: FontWeight.bold,
    //                                 color: Color(0xFF1A1A1A),
    //                               ),
    //                             ),
    //                           ],
    //                         ),
    //                       );
    //                     },
    //                   ),
    //                 );
    //               },
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
