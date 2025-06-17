// import 'dart:convert';
// import 'package:autobazzaar/presentation/screens/AutoParts/components/autoparts_listing.dart';
// // import 'package:autobazzaar/presentation/screens/AutoShop_Service/auto_shop_service_sub_options.dart';
// // import 'package:autobazzaar/presentation/screens/MainFilter/main_filter_service.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:autobazzaar/components/custom_appbarsearch.dart';
// import 'package:autobazzaar/components/home_carousel.dart';
// import 'package:autobazzaar/data/models/dummy_data.dart';
// import 'package:autobazzaar/models/vehicle_category.dart';
// import 'package:autobazzaar/presentation/screens/AutoSalesMain/Vehicle_type/components/vehicle_categories.dart';

// class AutoPartsSubCategory extends StatefulWidget {
//   final String autotype;
//   final String category;

//   AutoPartsSubCategory({
//     super.key,
//     required this.autotype,
//     required this.category,
//   });

//   @override
//   State<AutoPartsSubCategory> createState() => _AutoPartsSubCategoryState();
// }

// class _AutoPartsSubCategoryState extends State<AutoPartsSubCategory> {
//   String? selectedCategoryName;
//   final Map<String, String> autoTypeFolderMap = {
//     "Car": "car",
//     "Motor bike": "motorbike",
//     "3-Wheeler": "3wheeler",
//     "Van": "van",
//     "Taxi": "taxi",
//     "Bus": "bus",
//     "Lorry": "lorry",
//     "Quad/Buggy": "quad_buggy",
//     "RV/Camper van": "rv_campervan",
//     "Water Crafts": "watercrafts",
//   };

//   // Load raw subcategories from asset
//   Future<Map<String, dynamic>> loadSubCategoryData() async {
//     final folderName = autoTypeFolderMap[widget.autotype];

//     if (folderName == null) {
//       throw Exception("Invalid autotype: ${widget.autotype}");
//     }

//     final Map<String, String> categoryFileMap = {
//       "Auto Spare Parts": "car_spare_part.json",
//       "Auto Accessories": "car_accessories.json",
//       "Auto Body Parts": "car_body_part.json",
//       "Bike Spare Parts": "motorbike_sparepart.json",
//       "Bike Body Panels": "motorbike_bodypart.json",
//       "Bike Accessories": "motorbike_accessories.json",
//       // Add more if needed
//     };

//     final fileName = categoryFileMap[widget.category];

//     if (fileName == null) {
//       throw Exception("No matching file for category: ${widget.category}");
//     }

//     final assetPath = 'assets/json/auto_parts/$folderName/$fileName';
//     final String jsonString = await rootBundle.loadString(assetPath);
//     return json.decode(jsonString);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomSearchAppBar(backarrow: true),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             PromoCarousel(promoList: promoCards),
//             const SizedBox(height: 20),
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
//                         gridHeight = 600;
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
//                               // Handle tap if needed
//                               final selectedData =
//                                   snapshot.data?[category.name];
//                               final List<dynamic> items =
//                                   selectedData?['items'] ?? [];
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder:
//                                       (_) => AutoPartsListing(
//                                         items: items.cast<String>(),
//                                         title: category.name,
//                                       ),
//                                 ),
//                               );
//                               setState(() {
//                                 selectedCategoryName = category.name;
//                               });
//                             },
//                             count: 4,
//                             ratio: .75,
//                             svg: false,
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
import 'package:autobazzaar/presentation/screens/PostScreens/Main_Category/Shop_Service/auto_service_sub_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:autobazzaar/core/theme/colors.dart';
import 'package:autobazzaar/presentation/screens/AutoShop_Service/auto_shop_service_sub_options.dart';

class AutoPartsSubCategory extends StatefulWidget {
  final String autotype;
  final String name;
  final String namesub;
  final String category;
  final bool ispost;
  const AutoPartsSubCategory({
    super.key,
    required this.autotype,
    required this.category, required this.ispost, required this.name, required this.namesub,
  });

  @override
  State<AutoPartsSubCategory> createState() => _AutoPartsSubCategoryState();
}

class _AutoPartsSubCategoryState extends State<AutoPartsSubCategory> {
  late Future<Map<String, dynamic>> _subCategoriesFuture;

Future<Map<String, dynamic>> _loadSubCategories() async {
  final String path = 'assets/json/auto_parts/car/car_data.json'; // Adjust path
  final String jsonStr = await rootBundle.loadString(path);
  final Map<String, dynamic> decoded = json.decode(jsonStr);

  // Instead of: final categoryData = decoded[widget.category];
  final Map<String, dynamic>? subCategories = decoded[widget.category];

  if (subCategories == null || subCategories.isEmpty) return {};

  return subCategories.map((key, value) {
    if (value is Map<String, dynamic>) {
      return MapEntry(key, value);
    } else {
      return MapEntry(key, {}); // Fallback if something goes wrong
    }
  });
}


  @override
  void initState() {
    super.initState();
    _subCategoriesFuture = _loadSubCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
        backgroundColor: red,
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _subCategoriesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No subcategories found"));
          }

          final subCategories = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: GridView.builder(
              itemCount: subCategories.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 0.70,
              ),
              itemBuilder: (context, index) {
                final subCatName = subCategories.keys.elementAt(index);
                final subCatData = subCategories[subCatName]!;
                final List<String> items =
                    List<String>.from(subCatData['items'] ?? []);
                final String imagePath = subCatData['image'] ?? '';

                return GestureDetector(
                  onTap: () {
                    if (items.isNotEmpty) {
                      if(widget.ispost==true){
  Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => 
                          AutoServiceDetailScreen(
                           categoryTitle: subCatName,
                            items: items, name: widget.name, namesub: widget.namesub, // Send as map
                          ),
                        ),
                      );
                      }
                      else{
                          Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => AutoShopServiceSubOptions(
                            title: subCatName,
                            items: {'items': items}, // Send as map
                          ),
                        ),
                      );
                      }
                    }
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        padding: const EdgeInsets.all(10),
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
                        child: imagePath.endsWith(".svg")
                            ? SvgPicture.asset(imagePath, fit: BoxFit.contain)
                            : Image.asset(imagePath, fit: BoxFit.contain),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        subCatName,
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
    );
  }
}
