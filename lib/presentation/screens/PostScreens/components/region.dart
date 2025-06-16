// car_year_screen.dart
import 'dart:io';

import 'package:autobazzaar/data/models/dummy_data.dart';
import 'package:autobazzaar/presentation/screens/PostScreens/components/brand_show.dart';
// import 'package:autobazzaar/presentation/screens/PostScreens/components/state_area.dart';
import 'package:autobazzaar/presentation/screens/PostScreens/components/transmission.dart';
import 'package:flutter/material.dart';
// import 'dummy_years.dart'; // Import the dummy data

class RegionScreen extends StatefulWidget {
  final String? name;
  final String? namesub;
  final String? brand;
  final List<String>? models;
  final List<File>? images; // <-- new param
  final String? title;
  final String? description;
  final String? year;
  //auto services
  // for auto services
  final String? mainheading;
  final List<String>? subheading;
  final Map<String, Set<String>>? services;
  final String? contactnumber;
  final String? country;
  final String? state;
  final String? city;
  final String? autotype;
  const RegionScreen({
    super.key,
    this.namesub,
    this.brand,
    this.models,
    this.images,
    this.title,
    this.description,
    this.year,
    this.autotype,
    // this.selectedCategory,
    // this.selectedSubCategory,
    this.name,
    this.mainheading,
    this.subheading,
    this.services, this.contactnumber, this.country, this.state, this.city,
  });

  @override
  _RegionScreenState createState() => _RegionScreenState();
}

class _RegionScreenState extends State<RegionScreen> {
  List<String> filteredregion = regionalSpecifications;
  final TextEditingController _searchController = TextEditingController();
  // Map<String, Widget Function()> categoryRoutes = {
  //   "Auto Sales": () => TransmissionScreen(),
  //   "Shop Services": () => StateArea(),
  //   // "Trucks": () => TruckDetailsScreen(),
  //   // Add more mappings
  // };
  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterYears);
  }

  void _filterYears() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      filteredregion =
          regionalSpecifications
              .where((year) => year.toLowerCase().contains(query))
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
      appBar: AppBar(title: Text("What are the regional specifications ?")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.check_circle, color: Colors.green),
                SizedBox(width: 8),
                Text("Choose regional specifications"),
              ],
            ),
            SizedBox(height: 16),
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search for Region",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: filteredregion.length,
                itemBuilder: (context, index) {
                  final year = filteredregion[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      title: Text(
                        year,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(Icons.chevron_right),
                      onTap: () {
                        if (widget.namesub == "Auto Sales") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => TransmissionScreen(
                                    namesub: widget.namesub!,
                                    brand: widget.brand!,
                                    models: widget.models!,
                                    images: widget.images!,
                                    title: widget.title!,
                                    description: widget.description!,
                                    year: widget.year!,
                                    region: _searchController.text,
                                  ),
                            ),
                          );
                        } else if (widget.namesub == "Shop Services") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => BrandScreen(
                                autotype: widget.autotype,
                                mainheading: widget.mainheading!,
                                subheading: widget.subheading!,
                                services: widget.services!,
                                name: widget.name!,
                                namesub: widget.namesub!,
                                region: _searchController.text,
                              ),
                            ),
                          );
                        }
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
