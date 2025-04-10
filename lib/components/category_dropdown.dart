import 'package:autobazzaar/core/theme/colors.dart';
import 'package:flutter/material.dart';

class CategoryDropdown extends StatefulWidget {
  final Function(String?) onMainCategoryChanged;
  final Function(List<String>) onSubCategoryChanged;
  final List<String> mainCategories;
  final Map<String, List<String>> subCategories;
  final String title;
  final String titlesub;
  const CategoryDropdown({
    super.key,
    required this.onMainCategoryChanged,
    required this.onSubCategoryChanged,
    required this.mainCategories,
    required this.subCategories,
    required this.title, required this.titlesub,
  });

  @override
  _CategoryDropdownState createState() => _CategoryDropdownState();
}

class _CategoryDropdownState extends State<CategoryDropdown> {
  // Main Categories
  // final List<String> mainCategories = ["Electronics", "Vehicles", "Clothing"];

  // Subcategory Mapping
  // final Map<String, List<String>> subCategories = {
  //   "Electronics": ["Mobile Phones", "Laptops", "TVs"],
  //   "Vehicles": ["Cars", "Bikes", "Trucks"],
  //   "Clothing": ["Men", "Women", "Kids"],
  // };

  String? selectedMainCategory;
  List<String> filteredSubCategories = [];
  List<String> selectedSubCategories = [];

  void _showMultiSelectDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        List<String> tempSelected = List.from(selectedSubCategories);

        return AlertDialog(
           backgroundColor: redlight,
          title: const Text("Select Sub Categories", style: TextStyle(color: white),),
          content: SingleChildScrollView(
            child: Column(
              children:
                  filteredSubCategories.map((subCategory) {
                    return CheckboxListTile(
                       activeColor: white,
                  // fillColor: Colors.amber,
                  checkColor: redlight,
                      value: tempSelected.contains(subCategory),
                      title: Text(subCategory, style: TextStyle(color: white),),
                      onChanged: (checked) {
                        setState(() {
                          if (checked ?? false) {
                            tempSelected.add(subCategory);
                          } else {
                            tempSelected.remove(subCategory);
                          }
                        });
                      },
                    );
                  }).toList(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Cancel", style: TextStyle(color: white),),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedSubCategories = List.from(tempSelected);
                });
                widget.onSubCategoryChanged(selectedSubCategories);
                Navigator.of(context).pop();
              },
              child: const Text("Done", style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        // Main Category Dropdown
        DropdownButtonFormField<String>(
          dropdownColor: redlight,
          
          decoration: const InputDecoration(
            labelText: "Select Main Category",
            border: OutlineInputBorder(),
          ),
          value: selectedMainCategory,
          items:
              widget.mainCategories.map((category) {
                return DropdownMenuItem(value: category, child: Text(category, style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),));
              }).toList(),
          onChanged: (value) {
            setState(() {
              selectedMainCategory = value;
              filteredSubCategories = widget.subCategories[value] ?? [];
              selectedSubCategories = []; // Reset subcategory selection
            });
            widget.onMainCategoryChanged(value);
          },
          style: TextStyle(color: black),
        ),
        const SizedBox(height: 16),
        Text(widget.titlesub, style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
        // Multi-Select for Sub Categories
        GestureDetector(
          onTap: selectedMainCategory == null ? null : _showMultiSelectDialog,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child:
                selectedSubCategories.isEmpty
                    ? const Text(
                      "Select Sub Categories",
                      style: TextStyle(color: Colors.grey),
                    )
                    : Wrap(
                      spacing: 8.0,
                      runSpacing: 4.0,
                      children:
                          selectedSubCategories.map((subCategory) {
                            return Chip(
                              label: Text(subCategory),
                              backgroundColor: Colors.green.shade200,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            );
                          }).toList(),
                    ),
          ),
        ),
      ],
    );
  }
}
