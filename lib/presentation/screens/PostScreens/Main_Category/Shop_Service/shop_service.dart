// import 'dart:convert';
// import 'package:autobazzaar/core/theme/colors.dart';
// import 'package:autobazzaar/presentation/screens/PostScreens/Main_Category/Shop_Service/auto_service_sub_options.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:autobazzaar/models/vehicle_category.dart';
// import 'package:autobazzaar/presentation/screens/AutoSalesMain/Vehicle_type/components/vehicle_categories.dart';

// class AutoServicePost extends StatelessWidget {
//   final String autotype;

//   const AutoServicePost({super.key, required this.autotype});

//   Future<Map<String, dynamic>> loadSubCategoryData() async {
//     final assetPath = 'assets/json/auto_services/auto_service_list.json';
//     final String jsonString = await rootBundle.loadString(assetPath);
//     return json.decode(jsonString);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: white,
//       appBar: AppBar(
//         title: Text("Choose service category"),
//         backgroundColor: red,
//       ),
//       // appBar: CustomSearchAppBar(backarrow: true),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // PromoCarousel(promoList: promoCards),
//             // const SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 8.0),
//                     child: Text(
//                       "Browse By Categories",
//                       style: TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                         letterSpacing: 1.1,
//                         color: Colors.black87,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 16),

//                   FutureBuilder<Map<String, dynamic>>(
//                     future: loadSubCategoryData(),
//                     builder: (context, snapshot) {
//                       if (snapshot.connectionState == ConnectionState.waiting) {
//                         return const Center(child: CircularProgressIndicator());
//                       } else if (snapshot.hasError) {
//                         return const Center(
//                           child: Text("Failed to load categories"),
//                         );
//                       }

//                       final data = snapshot.data ?? {};
//                       final keys = data.keys.toList();
//                       final totalItems = keys.length;

//                       // Dynamically determine height
//                       double gridHeight;
//                       if (totalItems <= 4) {
//                         gridHeight = 150;
//                       } else if (totalItems <= 8) {
//                         gridHeight = 300;
//                       } else if (totalItems <= 12) {
//                         gridHeight = 450;
//                       } else {
//                         gridHeight = 450;
//                       }

//                       // Convert map to VehicleCategory list for the grid
//                       final categoryList =
//                           keys.map((key) {
//                             final imagePath = data[key]['image'] ?? '';
//                             return VehicleCategory(
//                               name: key,
//                               imagePath: imagePath,
//                             );
//                           }).toList();

//                       return Column(
//                         children: [
//                           VehicleGridPager(
//                             page: categoryList,
//                             height: gridHeight,
//                             onCategoryTap: (category) {
//                               final items =
//                                   data[category.name]['items']
//                                       as List<dynamic>? ??
//                                   [];
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder:
//                                       (_) => AutoServiceDetailScreen(
//                                         categoryTitle: category.name,
//                                         items: List<String>.from(items),
//                                       ),
//                                 ),
//                               );
//                             },

//                             count: 4,
//                             ratio: .6,
//                             svg: true,
//                           ),
//                         ],
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:autobazzaar/core/theme/colors.dart';
import 'package:autobazzaar/presentation/screens/PostScreens/Main_Category/Shop_Service/auto_service_sub_options.dart';

class AutoServicePost extends StatelessWidget {
  final String autotype;

  const AutoServicePost({super.key, required this.autotype});

  Future<Map<String, dynamic>> loadSubCategoryData() async {
    final assetPath = 'assets/json/auto_services/auto_service_list.json';
    final String jsonString = await rootBundle.loadString(assetPath);
    return json.decode(jsonString);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB), // light background
      appBar: AppBar(
        title: const Text("Choose Service Category"),
        backgroundColor: red,
        elevation: 0,
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: loadSubCategoryData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError || snapshot.data == null) {
            return const Center(child: Text("Failed to load categories"));
          }

          final data = snapshot.data!;
          final keys = data.keys.toList();

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: keys.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.56,
              ),
              itemBuilder: (context, index) {
                final key = keys[index];
                final imagePath = data[key]['image'] ?? '';
                final items = List<String>.from(data[key]['items'] ?? []);

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (_) => AutoServiceDetailScreen(
                              categoryTitle: key,
                              items: items,
                            ),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 225, 221, 221),
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
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
