import 'dart:convert';
import 'dart:io';
import 'package:autobazzaar/presentation/screens/PostScreens/components/models_show.dart';
import 'package:autobazzaar/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BrandScreen extends StatefulWidget {
  final String? name;
  final String? namesub;
  final String? autotype;
  final bool? filteruse;
  // final String? namesub;
  final List<File>? images; // <-- new param
  final String? title;
  final String? description;
  // for auto services
  final String? mainheading;
  final List<String>? subheading;
  final Map<String, Set<String>>? services;
  final String? contactnumber;
  final String? country;
  final String? state;
  final String? region;
  final String? city;
  const BrandScreen({
    super.key,
    this.autotype,
    this.filteruse,
    this.namesub,
    this.images,
    this.title,
    this.description,
    this.mainheading,
    this.subheading,
    this.services,
    this.contactnumber,
    this.country,
    this.state,
    this.city,
    this.name,
    this.region,
  });
  @override
  State<BrandScreen> createState() => _BrandScreenState();
}

class _BrandScreenState extends State<BrandScreen> {
  Map<String, List<String>> carData = {};
  List<String> brands = [];
  List<String> filteredBrands = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadCarData();
  }

  Future<void> loadCarData() async {
    String jsonFile = '';

    if (widget.autotype == "Car" || widget.autotype == "Taxi") {
      jsonFile = 'assets/json/carbrand.json';
    } else if (widget.autotype == "Motor bike") {
      jsonFile = 'assets/json/bikebrand.json';
    } else if (widget.autotype == "Quad/Buggy") {
      jsonFile = 'assets/json/quadbikebrand.json';
    } else if (widget.autotype == "Water Crafts") {
      jsonFile = 'assets/json/boatbrand.json';
    } else {
      debugPrint("Invalid type: ${widget.autotype}");
      return;
    }

    final String response = await rootBundle.loadString(jsonFile);
    final List<dynamic> data = json.decode(response);

    final Map<String, List<String>> groupedData = {};
    for (var item in data) {
      final brand = item['Brand name'];
      final model = item['Product name'].toString();

      if (groupedData.containsKey(brand)) {
        groupedData[brand]!.add(model);
      } else {
        groupedData[brand] = [model];
      }
    }

    setState(() {
      carData = groupedData;
      brands = groupedData.keys.toList();
      filteredBrands = brands; // initialize filtered list
    });
  }

  void filterBrands(String query) {
    final lowercaseQuery = query.toLowerCase();
    setState(() {
      filteredBrands =
          brands
              .where((brand) => brand.toLowerCase().startsWith(lowercaseQuery))
              .toList();
    });
  }

  IconData getIconForType(String type) {
    switch (type) {
      case "Car":
      case "Taxi":
        return Icons.directions_car;
      case "Motor bike":
        return Icons.motorcycle;
      case "Quad/Buggy":
        return Icons.electric_bike;
      case "Water Crafts":
        return Icons.directions_boat;
      default:
        return Icons.directions_car; // fallback
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "What is the Car Make ?",
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: redlight,
        elevation: 4,
        shadowColor: Colors.grey.shade300,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body:
          carData.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextField(
                      controller: searchController,
                      onChanged: filterBrands,
                      decoration: InputDecoration(
                        hintText: 'Search brand...',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: filteredBrands.length,
                      itemBuilder: (context, index) {
                        final brand = filteredBrands[index];
                        return Card(
                          elevation: 4,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => ModelScreen(
                                        brand: brand,
                                        models: carData[brand]!,
                                        icon: getIconForType(widget.autotype!),
                                        filteruse: widget.filteruse!,
                                        namesub: widget.namesub!,
                                        images: widget.images!,
                                        title: widget.title!,
                                        description: widget.description!,
                                      ),
                                ),
                              );
                            },
                            borderRadius: BorderRadius.circular(16),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    getIconForType(widget.autotype!),
                                    size: 28,
                                    color: red,
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Text(
                                      brand,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black87,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 28,
                                    color: red,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
    );
  }
}
