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
  final String maincategory;
  final bool isposting;
  const AutoPartsSubCategory({
    super.key,
    required this.autotype,
    required this.maincategory,
    required this.isposting,
    required this.name,
    required this.namesub,
  });

  @override
  State<AutoPartsSubCategory> createState() => _AutoPartsSubCategoryState();
}

class _AutoPartsSubCategoryState extends State<AutoPartsSubCategory> {
  late Future<Map<String, dynamic>> _subCategoriesFuture;

  Future<Map<String, dynamic>> _loadSubCategories() async {
    final String path =
        'assets/json/auto_parts/car/car_data.json'; // Adjust path
    final String jsonStr = await rootBundle.loadString(path);
    final Map<String, dynamic> decoded = json.decode(jsonStr);

    // Instead of: final categoryData = decoded[widget.category];
    final Map<String, dynamic>? subCategories = decoded[widget.maincategory];

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
    print(widget.maincategory);
    print(widget.isposting);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.maincategory), backgroundColor: red),
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
                final List<String> items = List<String>.from(
                  subCatData['items'] ?? [],
                );
                final String imagePath = subCatData['image'] ?? '';

                return GestureDetector(
                  onTap: () {
                    if (items.isNotEmpty) {
                      if (widget.isposting == true) {
                        print('>> Navigating to AutoServiceDetailScreen');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (_) => AutoServiceDetailScreen(
                                  subcategory: subCatName,
                                  services: items,
                                  name: widget.name,
                                  namesub: widget.namesub,
                                  maincategory: widget.maincategory,
                                  autotype: widget.autotype, // Send as map
                                ),
                          ),
                        );
                      } else {
                        print('>> Navigating to AutoShopServiceSubOptions');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (_) => AutoShopServiceSubOptions(
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
                        child:
                            imagePath.endsWith(".svg")
                                ? SvgPicture.asset(
                                  imagePath,
                                  fit: BoxFit.contain,
                                )
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
