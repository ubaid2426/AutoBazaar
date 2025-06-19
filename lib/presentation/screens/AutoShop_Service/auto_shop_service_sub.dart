import 'dart:convert';
import 'package:autobazzaar/presentation/screens/Horizontal_Filter/components/multi_select_option1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:autobazzaar/presentation/screens/AutoShop_Service/auto_shop_service_sub_options.dart';

class AutoServiceSubCategoryView extends StatefulWidget {
  final String autotype;
  final String selectedCategory;
  final bool ispost;
  final String? name;
  final String? namesub;
  const AutoServiceSubCategoryView({
    super.key,
    required this.autotype,
    required this.selectedCategory,
    required this.ispost,
    this.name,
    this.namesub,
  });

  @override
  State<AutoServiceSubCategoryView> createState() =>
      _AutoServiceSubCategoryViewState();
}

class _AutoServiceSubCategoryViewState
    extends State<AutoServiceSubCategoryView> {
  late Future<Map<String, List<String>>> futureGroupedMap;
  final Set<String> selectedSubcategories = {};
  final Map<String, List<String>> fullGroupedMap = {};

  Future<Map<String, List<String>>> loadGroupedMap() async {
    final assetPath = 'assets/json/auto_services/auto_service_car.json';
    final jsonString = await rootBundle.loadString(assetPath);
    final decoded = json.decode(jsonString);

    final categoryData =
        decoded[widget.autotype]?[widget.selectedCategory] ?? {};
    final Map<String, List<String>> groupedMap = {};

    for (var entry in categoryData.entries) {
      final subcategory = entry.key;
      final services = entry.value;

      if (services is List) {
        final serviceList =
            services.whereType<String>().map((e) => e.trim()).toList();
        groupedMap[subcategory] = serviceList;
      }
    }

    fullGroupedMap.addAll(groupedMap);
    return groupedMap;
  }

  @override
  void initState() {
    super.initState();
    futureGroupedMap = loadGroupedMap();
    print(widget.selectedCategory);
  }

  @override
  Widget build(BuildContext context) {
    print(widget.selectedCategory);
    return Scaffold(
      appBar: AppBar(title: const Text("Select Service Groups")),
      body: FutureBuilder<Map<String, List<String>>>(
        future: futureGroupedMap,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No service groups available."));
          }

          final groupedMap = snapshot.data!;

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: groupedMap.length,
                  itemBuilder: (context, index) {
                    final subcategory = groupedMap.keys.elementAt(index);
                    final isSelected = selectedSubcategories.contains(
                      subcategory,
                    );

                    return Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      child: CheckboxListTile(
                        title: Text(
                          subcategory,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        value: isSelected,
                        onChanged: (val) {
                          setState(() {
                            if (val == true) {
                              selectedSubcategories.add(subcategory);
                            } else {
                              selectedSubcategories.remove(subcategory);
                            }
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (selectedSubcategories.isNotEmpty) {
                    final Map<String, List<String>> selectedServicesMap = {};

                    for (var sub in selectedSubcategories) {
                      selectedServicesMap[sub] = fullGroupedMap[sub] ?? [];
                    }
                    if (widget.ispost == true) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (_) => MultiSelectOption1(
                                options: selectedServicesMap,
                                ispost: true,
                                autotype: widget.autotype,
                                subheading: selectedSubcategories.toList(),
                                mainheading: widget.selectedCategory,
                                name: widget.name!,
                                namesub: widget.namesub!,
                              ),
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (_) => AutoShopServiceSubOptions(
                                items: selectedServicesMap,
                                title: "Selected Services",
                              ),
                        ),
                      );
                    }
                  }
                },
                child: const Text("Continue"),
              ),
              const SizedBox(height: 16),
            ],
          );
        },
      ),
    );
  }
}
