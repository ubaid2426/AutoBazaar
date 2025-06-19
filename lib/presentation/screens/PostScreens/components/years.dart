// car_year_screen.dart
import 'dart:io';

import 'package:autobazzaar/data/models/dummy_data.dart';
import 'package:autobazzaar/presentation/screens/PostScreens/components/Choose_plan/bodycondition.dart';
// import 'package:autobazzaar/presentation/screens/PostScreens/components/payment.dart';
import 'package:autobazzaar/presentation/screens/PostScreens/components/region.dart';
import 'package:flutter/material.dart';
// import 'dummy_years.dart'; // Import the dummy data

class YearScreen extends StatefulWidget {
  final String? name;
  final String namesub;
  final String? brand;
  final List<String>? models;
  final List<File> images; // <-- new param
  final String title;
  final String description;
  final String? maincategory;
  final String? subcategory;
  final List<String>? services;
  final String? autotype;
  final String? bodytype;
  const YearScreen({
    super.key,
    required this.namesub,
    this.brand,
    this.models,
    required this.images,
    required this.title,
    required this.description,
    this.maincategory,
    this.subcategory,
    this.services,
    this.autotype,
    this.bodytype,
    this.name,
  });

  @override
  _YearScreenState createState() => _YearScreenState();
}

class _YearScreenState extends State<YearScreen> {
  List<String> filteredYears = yearspost;
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterYears);
  }

  void _filterYears() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      filteredYears =
          yearspost
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
      appBar: AppBar(title: Text("What is the Car Year?")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.check_circle, color: Colors.green),
                SizedBox(width: 8),
                Text("Choose the manufacturing year of the car"),
              ],
            ),
            SizedBox(height: 16),
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search for Year",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: filteredYears.length,
                itemBuilder: (context, index) {
                  final year = filteredYears[index];
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
                        if (widget.namesub == 'Auto\n Parts') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => BodyCondition(
                                    name: widget.name!,
                                    namesub: widget.namesub,
                                    autotype: widget.autotype,
                                    title: widget.title,
                                    images: widget.images,
                                    description: widget.description,
                                    maincategory: widget.maincategory,
                                    subcategory: widget.subcategory,
                                    services: widget.services,
                                    bodytype: widget.bodytype,
                                    year: year,
                                  ),
                            ),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => RegionScreen(
                                    namesub: widget.namesub,
                                    brand: widget.brand,
                                    models: widget.models,
                                    images: widget.images,
                                    title: widget.title,
                                    description: widget.description,
                                    year: year,
                                    name: widget.name??"",
                                  ),
                            ),
                          );
                        }

                        // Handle year selection
                        print("Selected year: $year");
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
