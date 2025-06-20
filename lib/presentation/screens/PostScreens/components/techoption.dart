import 'dart:io';

import 'package:autobazzaar/core/theme/colors.dart';
import 'package:autobazzaar/data/models/dummy_data.dart';
import 'package:autobazzaar/presentation/screens/PostScreens/components/bodytype.dart';
import 'package:flutter/material.dart';

class TechOptions extends StatefulWidget {
  final String name;
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
  final String fueltype;
  final String enginesize;
  final String excolor;
  final String incolor;
  final List<String> inoption;
  const TechOptions({
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
    required this.autotype,
    required this.name,
  });

  @override
  State<TechOptions> createState() => _TechOptionsState();
}

class _TechOptionsState extends State<TechOptions> {
  final TextEditingController _searchController = TextEditingController();

  List<String> filteredOptions = [];
  List<String> selectedOptions = [];

  @override
  void initState() {
    super.initState();
    filteredOptions = carTechnologyOptions;
    _searchController.addListener(_filterOptions);
  }

  void _filterOptions() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      filteredOptions =
          carTechnologyOptions
              .where((option) => option.toLowerCase().contains(query))
              .toList();
    });
  }

  void _toggleOption(String option) {
    setState(() {
      if (selectedOptions.contains(option)) {
        selectedOptions.remove(option);
      } else {
        selectedOptions.add(option);
      }
    });
  }

  void _removeTag(String option) {
    setState(() {
      selectedOptions.remove(option);
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
      appBar: AppBar(title: Text("What are the Technology Options")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildCheckRow("More than one option can be added"),
            _buildCheckRow(
              "Technology Options increase your chance of getting the right buyer",
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search for Technology Options",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),
            if (selectedOptions.isNotEmpty)
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children:
                    selectedOptions
                        .map(
                          (option) => Chip(
                            label: Text(option),
                            deleteIcon: Icon(Icons.close),
                            onDeleted: () => _removeTag(option),
                            backgroundColor: Colors.black,
                            labelStyle: TextStyle(color: Colors.white),
                            deleteIconColor: Colors.white,
                          ),
                        )
                        .toList(),
              ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: filteredOptions.length,
                itemBuilder: (context, index) {
                  final option = filteredOptions[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: CheckboxListTile(
                      checkColor: red,
                      fillColor: MaterialStateProperty.all(Colors.white),
                      value: selectedOptions.contains(option),
                      onChanged: (_) => _toggleOption(option),
                      title: Text(
                        option,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  );
                },
              ),
            ),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 100,
                height: 70,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: red,
                    foregroundColor: white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => BodyTypeScreen(
                              name: widget.name,
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
                              excolor: widget.excolor,
                              incolor: widget.incolor,
                              inoption: selectedOptions,
                              technology: selectedOptions,
                              autotype: widget.autotype,
                            ),
                      ),
                    );
                  },
                  child: const Text("Next →", style: TextStyle(fontSize: 20)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckRow(String text) {
    return Row(
      children: [
        Icon(Icons.check_circle, color: Colors.green, size: 20),
        SizedBox(width: 8),
        Flexible(child: Text(text)),
      ],
    );
  }
}
