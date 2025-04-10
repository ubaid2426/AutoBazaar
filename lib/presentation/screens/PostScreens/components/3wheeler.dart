import 'dart:convert';
import 'package:autobazzaar/presentation/screens/PostScreens/components/models_show.dart';
import 'package:autobazzaar/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThreeWheelerScreen extends StatefulWidget {
  final String type;
  const ThreeWheelerScreen({super.key, required this.type});

  @override
  State<ThreeWheelerScreen> createState() => _ThreeWheelerScreenState();
}

class _ThreeWheelerScreenState extends State<ThreeWheelerScreen> {
  Map<String, List<String>> threeWheelerData = {};
  List<String> brands = [];
  List<String> filteredBrands = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadThreeWheelerData();
  }

  Future<void> loadThreeWheelerData() async {
    String jsonFile = '';
    if (widget.type == "Quad/Buggy") {
      jsonFile = 'assets/json/quadbikebrand.json';
    } else if (widget.type == "3-Wheeler") {
      jsonFile = 'assets/json/3wheelerbrand.json';
    } else {
      debugPrint("Invalid type: ${widget.type}");
      return;
    }

    final String response = await rootBundle.loadString(jsonFile);
    final List<dynamic> data = json.decode(response);

    final Map<String, List<String>> groupedData = {};

    for (var item in data) {
      if (item['Category'] == "3 Wheelers") {
        final brand = item['Brand Name'];
        final model = item['Product Name'].toString();

        if (groupedData.containsKey(brand)) {
          groupedData[brand]!.add(model);
        } else {
          groupedData[brand] = [model];
        }
      } else if (item['Category'] == "Quadbikes\/Buggy") {
        final brand = item['Brand Name'];
        final model = item['Product Name'].toString();

        if (groupedData.containsKey(brand)) {
          groupedData[brand]!.add(model);
        } else {
          groupedData[brand] = [model];
        }
      }
    }

    setState(() {
      threeWheelerData = groupedData;
      brands = groupedData.keys.toList();
      filteredBrands = brands; // initialize filtered list
    });
  }

  void filterBrands(String query) {
    final lowercaseQuery = query.toLowerCase();
    setState(() {
      filteredBrands = brands
          .where((brand) => brand.toLowerCase().startsWith(lowercaseQuery))
          .toList();
    });
  }

  IconData getIconForType(String type) {
    switch (type) {
      case "Quad/Buggy":
        return Icons.electric_bike;
      case "3-Wheeler":
        return Icons.motorcycle; // fallback
      default:
        return Icons.electric_rickshaw; // fallback
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Choose a 3-Wheeler Brand",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: redlight,
        elevation: 4,
        shadowColor: Colors.grey.shade300,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: threeWheelerData.isEmpty
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
                                builder: (context) => ModelScreen(
                                  brand: brand,
                                  models: threeWheelerData[brand]!,
                                  icon: getIconForType(widget.type),
                                ),
                              ),
                            );
                          },
                          borderRadius: BorderRadius.circular(16),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              children: [
                                Icon(
                                  getIconForType(widget.type),
                                  size: 28,
                                  color: red,
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Text(
                                    brand,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                                Icon(Icons.arrow_forward_ios, size: 20, color: red),
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
