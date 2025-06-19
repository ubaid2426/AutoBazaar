// car_year_screen.dart
import 'dart:io';

import 'package:autobazzaar/data/models/dummy_data.dart';
import 'package:autobazzaar/presentation/screens/PostScreens/components/payment.dart';
// import 'package:autobazzaar/presentation/screens/PostScreens/components/excolor.dart';
// import 'package:autobazzaar/presentation/screens/PostScreens/components/repaint.dart';
import 'package:flutter/material.dart';
// import 'dummy_years.dart'; // Import the dummy data

class Insuranced extends StatefulWidget {
  final String name;
  final String? namesub;
  final String? brand;
  final List<String>? models;
  final List<File>? images; // <-- new param
  final String? title;
  final String? description;
  final String? transmission;
  final String? year;
  final String? region;
  final String? fueltype;
  final String? enginesize;
  final String? excolor;
  final String? incolor;
  final List<String>? inoption;
  final List<String>? technology;
  final String? bodytype;
  final String? seats;
  final String? repainted;
  final String? bodycondition;
  Insuranced({
    super.key,
    this.namesub,
    this.brand,
    this.models,
    this.images,
    this.title,
    this.description,
    this.transmission,
    this.year,
    this.region,
    this.fueltype,
    this.enginesize,
    this.excolor,
    this.incolor,
    this.inoption,
    this.technology,
    this.bodytype,
    this.seats,
    this.repainted,
    this.bodycondition,
    required this.name,
  });

  @override
  _InsurancedState createState() => _InsurancedState();
}

class _InsurancedState extends State<Insuranced> {
  List<String> filteredtransmission = insurance;
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
          insurance
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
      appBar: AppBar(title: Text("What is the Insurance Type?")),
      body: GestureDetector(
        onTap:
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => Insuranced(
                      name: widget.name,
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
                      repainted: widget.repainted,
                      bodycondition: widget.bodycondition,
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
                  Text("Choose the tpye of car insurance"),
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
                                  (context) => PaymentMethod(
                                    name: widget.name,
                                    namesub: widget.namesub!,
                                    brand: widget.brand!,
                                    models: widget.models!,
                                    images: widget.images!,
                                    title: widget.title!,
                                    description: widget.description!,
                                    transmission: widget.transmission!,
                                    year: widget.year!,
                                    region: widget.region!,
                                    fueltype: widget.fueltype!,
                                    enginesize: widget.enginesize!,
                                    excolor: widget.excolor!,
                                    incolor: widget.incolor!,
                                    inoption: widget.inoption!,
                                    technology: widget.technology!,
                                    bodytype: widget.bodytype!,
                                    seats: widget.seats!,
                                    repainted: widget.repainted!,
                                    bodycondition: widget.bodycondition!,
                                    insurance: year,
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
