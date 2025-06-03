import 'dart:convert';
import 'package:autobazzaar/presentation/screens/AutoParts/components/autoparts_listing.dart';
import 'package:autobazzaar/presentation/screens/AutoShop_Service/auto_shop_service_sub_options.dart';
import 'package:autobazzaar/presentation/screens/MainFilter/main_filter_service.dart';
import 'package:autobazzaar/presentation/screens/PostScreens/components/brand_show.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:autobazzaar/components/custom_appbarsearch.dart';
import 'package:autobazzaar/components/home_carousel.dart';
import 'package:autobazzaar/data/models/dummy_data.dart';
import 'package:autobazzaar/models/vehicle_category.dart';
import 'package:autobazzaar/presentation/screens/AutoSalesMain/Vehicle_type/components/vehicle_categories.dart';

class AutoPartsSubform extends StatefulWidget {
  final String autotype;
  final String category;
  // final String categoryheading;
  AutoPartsSubform({super.key, required this.autotype, required this.category});

  @override
  State<AutoPartsSubform> createState() => _AutoPartsSubCategoryState();
}

class _AutoPartsSubCategoryState extends State<AutoPartsSubform> {
  String? selectedCategoryName;
  final Map<String, String> autoTypeFolderMap = {
    "Car": "car",
    "Motor bike": "motorbike",
    "3-Wheeler": "3wheeler",
    "Van": "van",
    "Taxi": "taxi",
    "Bus": "bus",
    "Lorry": "lorry",
    "Quad/Buggy": "quad_buggy",
    "RV/Camper van": "rv_campervan",
    "Water Crafts": "watercrafts",
  };

  // Load raw subcategories from asset
  Future<Map<String, dynamic>> loadSubCategoryData() async {
    final folderName = autoTypeFolderMap[widget.autotype];

    if (folderName == null) {
      throw Exception("Invalid autotype: ${widget.autotype}");
    }

    final Map<String, String> categoryFileMap = {
      "Auto Spare Parts": "car_spare_part.json",
      "Auto Accessories": "car_accessories.json",
      "Auto Body Parts": "car_body_part.json",
      "Bike Spare Parts": "motorbike_sparepart.json",
      "Bike Body Panels": "motorbike_bodypart.json",
      "Bike Accessories": "motorbike_accessories.json",
      // Add more if needed
    };

    final fileName = categoryFileMap[widget.category];

    if (fileName == null) {
      throw Exception("No matching file for category: ${widget.category}");
    }

    final assetPath = 'assets/json/auto_parts/$folderName/$fileName';
    final String jsonString = await rootBundle.loadString(assetPath);
    return json.decode(jsonString);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // PromoCarousel(promoList: promoCards),
            // const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
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
                  const SizedBox(height: 16),

                  FutureBuilder<Map<String, dynamic>>(
                    future: loadSubCategoryData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return const Center(
                          child: Text("Failed to load categories"),
                        );
                      }

                      final data = snapshot.data ?? {};
                      final keys = data.keys.toList();
                      final totalItems = keys.length;

                      // Dynamically determine height
                      double gridHeight;
                      if (totalItems <= 4) {
                        gridHeight = 150;
                      } else if (totalItems <= 8) {
                        gridHeight = 300;
                      } else if (totalItems <= 12) {
                        gridHeight = 450;
                      } else {
                        gridHeight = 600;
                      }

                      // Convert map to VehicleCategory list for the grid
                      final categoryList =
                          keys.map((key) {
                            final imagePath = data[key]['image'] ?? '';
                            return VehicleCategory(
                              name: key,
                              imagePath: imagePath,
                            );
                          }).toList();
                      return Column(
                        children: [
                          VehicleGridPager(
                            page: categoryList,
                            height: gridHeight,
                            onCategoryTap: (category) {
                              // Handle tap if needed
                              final selectedData =
                                  snapshot.data?[category.name];
                              final List<dynamic> items =
                                  selectedData?['items'] ?? [];
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (_) => BrandScreen(
                                        type: widget.autotype,
                                        filteruse: false,
                                        category: "Auto Parts",
                                      ),
                                ),
                              );
                              setState(() {
                                selectedCategoryName = category.name;
                              });
                            },
                            count: 4,
                            ratio: .75,
                            svg: false,
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
