// car_year_screen.dart
import 'dart:io';

import 'package:autobazzaar/data/models/dummy_data.dart';
// import 'package:autobazzaar/presentation/screens/PostScreens/components/excolor.dart';
import 'package:autobazzaar/presentation/screens/PostScreens/components/repaint.dart';
import 'package:flutter/material.dart';
// import 'dummy_years.dart'; // Import the dummy data

class SeatsScreen extends StatefulWidget {
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
  const SeatsScreen({
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
  });

  @override
  _SeatsScreenState createState() => _SeatsScreenState();
}

class _SeatsScreenState extends State<SeatsScreen> {
  List<String> filteredtransmission = carSeats;
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterYears);
  }

  void _filterYears() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      filteredtransmission =
          carSeats.where((year) => year.toLowerCase().contains(query)).toList();
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
      appBar: AppBar(title: Text("How many seats?")),
      body: GestureDetector(
        onTap:
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => SeatsScreen(
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
                  Icon(Icons.check_circle, color: Colors.green),
                  SizedBox(width: 8),
                  Text("Choose the number of car seats"),
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
                                    seats: year,
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
