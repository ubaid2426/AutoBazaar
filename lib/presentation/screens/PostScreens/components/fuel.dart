// car_year_screen.dart
import 'dart:io';

import 'package:autobazzaar/data/models/dummy_data.dart';
import 'package:autobazzaar/presentation/screens/PostScreens/components/engine.dart';
import 'package:flutter/material.dart';
// import 'dummy_years.dart'; // Import the dummy data

class FuelScreen extends StatefulWidget {
  final String namesub;
  final String brand;
  final String autotype;
  final List<String> models;
  final List<File> images; // <-- new param
  final String title;
  final String description;
  final String transmission;
  final String year;
  final String region;
  const FuelScreen({
    super.key,
    required this.namesub,
    required this.brand,
    required this.models,
    required this.images,
    required this.title,
    required this.description,
    required this.transmission,
    required this.year,
    required this.region, required this.autotype,
  });

  @override
  _FuelScreenState createState() => _FuelScreenState();
}

class _FuelScreenState extends State<FuelScreen> {
  List<String> filteredtransmission = fuel;
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
          fuel.where((year) => year.toLowerCase().contains(query)).toList();
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
      appBar: AppBar(title: Text("What type of fuel ?")),
      body: GestureDetector(
        onTap:
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => FuelScreen(
                      namesub: widget.namesub,
                      brand: widget.brand,
                      models: widget.models,
                      images: widget.images,
                      year: widget.year,
                      title: widget.title,
                      description: widget.description,
                      region: widget.region,
                      transmission: widget.transmission, autotype: widget.autotype,
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
                  Text("Choose the type of vehicle fuel"),
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
                                  (context) => EngineScreen(
                                    namesub: widget.namesub,
                                    brand: widget.brand,
                                    models: widget.models,
                                    images: widget.images,
                                    year: widget.year,
                                    title: widget.title,
                                    description: widget.description,
                                    region: widget.region,
                                    transmission: widget.transmission,
                                    fueltype: year, autotype: widget.autotype,
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
