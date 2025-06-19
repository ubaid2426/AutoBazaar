// car_year_screen.dart
import 'dart:io';

import 'package:autobazzaar/data/models/dummy_data.dart';
import 'package:autobazzaar/presentation/screens/PostScreens/components/fuel.dart';
import 'package:flutter/material.dart';
// import 'dummy_years.dart'; // Import the dummy data

class TransmissionScreen extends StatefulWidget {
  final String name;
  final String namesub;
  final String brand;
  final String autotype;
  final List<String> models;
  final List<File> images; // <-- new param
  final String title;
  final String description;
  final String year;
  final String region;
  const TransmissionScreen({
    super.key,
    required this.namesub,
    required this.brand,
    required this.models,
    required this.images,
    required this.title,
    required this.description,
    required this.year,
    required this.region,
    required this.autotype,
    required this.name,
  });

  @override
  // ignore: library_private_types_in_public_api
  _TransmissionScreenState createState() => _TransmissionScreenState();
}

class _TransmissionScreenState extends State<TransmissionScreen> {
  List<String> filteredtransmission = transmission;
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
          transmission
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
      appBar: AppBar(title: Text("What is the Transmission type ?")),
      body: GestureDetector(
        onTap:
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => TransmissionScreen(
                      name: widget.name,
                      namesub: widget.namesub,
                      brand: widget.brand,
                      models: widget.models,
                      images: widget.images,
                      year: widget.year,
                      title: widget.title,
                      description: widget.description,
                      region: widget.region,
                      autotype: widget.autotype,
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
                  Text("Choose the type of Transmission (gear)"),
                ],
              ),
              SizedBox(height: 16),
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: "Search for Transmission",
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
                                  (context) => FuelScreen(
                                    name: widget.name,
                                    namesub: widget.namesub,
                                    brand: widget.brand,
                                    models: widget.models,
                                    images: widget.images,
                                    year: widget.year,
                                    title: widget.title,
                                    description: widget.description,
                                    region: widget.region,
                                    transmission: year,
                                    autotype: widget.autotype,
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
