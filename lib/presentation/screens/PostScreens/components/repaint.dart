// car_year_screen.dart
import 'dart:io';

import 'package:autobazzaar/core/theme/colors.dart';
import 'package:autobazzaar/data/models/dummy_data.dart';
import 'package:autobazzaar/presentation/screens/PostScreens/components/Choose_plan/bodycondition.dart';
// import 'package:autobazzaar/presentation/screens/PostScreens/components/excolor.dart';
import 'package:flutter/material.dart';
// import 'dummy_years.dart'; // Import the dummy data

class RepaintScreen extends StatefulWidget {
  final String? name;
  final String namesub;
  final String brand;
  final List<String> models;
  final List<File> images; // <-- new param
  final String title;
  final String description;
  final String transmission;
  final String year;
  final String region;
  final String fueltype;
  final String enginesize;
  final String excolor;
  final String incolor;
  final List<String> inoption;
  final List<String> technology;
  final String bodytype;
  final String seats;
  // final String
  const RepaintScreen({
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
    required this.enginesize,
    required this.excolor,
    required this.incolor,
    required this.inoption,
    required this.technology,
    required this.bodytype,
    required this.seats, this.name,
  });

  @override
  // ignore: library_private_types_in_public_api
  _RepaintScreenState createState() => _RepaintScreenState();
}

class _RepaintScreenState extends State<RepaintScreen> {
  List<String> filteredtransmission = repainted;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterYears);
  }

  void _filterYears() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      filteredtransmission =
          repainted
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
      appBar: AppBar(title: Text("Did the Car get Repainted?")),
      body: GestureDetector(
        onTap:
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => RepaintScreen(
                      namesub: widget.namesub,
                      brand: widget.brand,
                      models: widget.models,
                      images: widget.images,
                      title: widget.title,
                      description: widget.description,
                      transmission: widget.transmission,
                      year: widget.year,
                      region: widget.region,
                      fueltype: widget.fueltype,
                      enginesize: widget.enginesize,
                      excolor: widget.excolor,
                      incolor: widget.incolor,
                      inoption: widget.inoption,
                      technology: widget.technology,
                      bodytype: widget.bodytype,
                      seats: widget.seats,
                      name: widget.name,
                    ),
              ),
            ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.check_circle, color: red),
                  SizedBox(width: 8),
                  Text(
                    "Choose the paint condition of the car you want to sell",
                  ),
                ],
              ),
              SizedBox(height: 16),
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: "Search for ...",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredtransmission.length,
                  itemBuilder: (context, index) {
                    final year = filteredtransmission[index];
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => BodyCondition(
                                    namesub: widget.namesub,
                                    brand: widget.brand,
                                    models: widget.models,
                                    images: widget.images,
                                    title: widget.title,
                                    description: widget.description,
                                    transmission: widget.transmission,
                                    year: widget.year,
                                    region: widget.region,
                                    fueltype: widget.fueltype,
                                    enginesize: widget.enginesize,
                                    excolor: widget.excolor,
                                    incolor: widget.incolor,
                                    inoption: widget.inoption,
                                    technology: widget.technology,
                                    bodytype: widget.bodytype,
                                    seats: widget.seats,
                                    repainted: year,
                                    name: widget.name!,
                                  ),
                            ),
                          );
                          // Handle year selection
                          print("Selected region: $year");
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
