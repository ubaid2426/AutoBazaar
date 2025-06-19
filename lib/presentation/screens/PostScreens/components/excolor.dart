import 'dart:io';

import 'package:autobazzaar/data/models/dummy_data.dart';
import 'package:autobazzaar/presentation/screens/PostScreens/components/incolor.dart';
import 'package:flutter/material.dart';

class ExteriorColor extends StatefulWidget {
  final String namesub;
  final String brand;
  final List<String> models;
  final String autotype;
  final List<File> images; // <-- new param
  final String title;
  final String description;
  final String transmission;
  final String year;
  final String region;
  final String fueltype;
  final String enginesize;
  const ExteriorColor({
    super.key,
    required this.namesub,
    required this.brand,
    required this.models,
    required this.images,
    required this.title,
    required this.description,
    required this.transmission,
    required this.year,
    required this.region,
    required this.fueltype,
    required this.enginesize, required this.autotype,
  });

  @override
  State<ExteriorColor> createState() => _ExteriorColorState();
}

class _ExteriorColorState extends State<ExteriorColor> {
  final TextEditingController _searchController = TextEditingController();

  final List<String> topColors = ["White", "Black", "Grey", "Silver", "Red"];

  List<Map<String, dynamic>> filteredColors = [];

  @override
  void initState() {
    super.initState();
    filteredColors = carColors;
    _searchController.addListener(_filterColors);
  }

  void _filterColors() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      filteredColors =
          carColors
              .where((color) => color["name"].toLowerCase().contains(query))
              .toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("What color is the car exterior?")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.check_circle, color: Colors.green),
                SizedBox(width: 8),
                Text("Choose the exterior color of the car"),
              ],
            ),
            SizedBox(height: 16),
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search for Exterior Color ...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text("Top", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            SizedBox(
              height: 36,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: topColors.length,
                separatorBuilder: (_, __) => SizedBox(width: 8),
                itemBuilder: (context, index) {
                  return Chip(
                    label: Text(topColors[index]),
                    backgroundColor: Colors.grey.shade200,
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Exterior Color",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: filteredColors.length,
                itemBuilder: (context, index) {
                  final item = filteredColors[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(backgroundColor: item["color"]),
                      title: Text(
                        item["name"],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(Icons.chevron_right),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => InteriorColor(
                                  namesub: widget.namesub,
                                  brand: widget.brand,
                                  models: widget.models,
                                  images: widget.images,
                                  year: widget.year,
                                  title: widget.title,
                                  description: widget.description,
                                  region: widget.region,
                                  transmission: widget.transmission,
                                  fueltype: widget.fueltype,
                                  enginesize: widget.enginesize,
                                  excolor: item["name"],
                                  autotype: widget.autotype,
                                ),
                          ),
                        );
                        print("Selected Color: ${item["name"]}");
                        // You can navigate or return result here
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
