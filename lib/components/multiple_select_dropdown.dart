import 'package:autobazzaar/core/theme/colors.dart';
import 'package:flutter/material.dart';

class MultiSelectDropdown extends StatefulWidget {
  final List<String> options;
  final String title;
  final Function(List<String>) onSelectionChanged;

  const MultiSelectDropdown({
    super.key,
    required this.options,
    required this.title,
    required this.onSelectionChanged,
  });

  @override
  // ignore: library_private_types_in_public_api
  _MultiSelectDropdownState createState() => _MultiSelectDropdownState();
}

class _MultiSelectDropdownState extends State<MultiSelectDropdown> {
  List<String> selectedItems = [];

  void _onItemCheckedChange(String item, bool checked) {
    setState(() {
      if (checked) {
        selectedItems.add(item);
      } else {
        selectedItems.remove(item);
      }
    });
    widget.onSelectionChanged(selectedItems);
  }

  void _showMultiSelectDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: redlight,
          title: Text(widget.title, style: TextStyle(color: white),),
          content: SingleChildScrollView(
            child: Column(
              children: widget.options.map((item) {
                return CheckboxListTile(
                  activeColor: white,
                  // fillColor: Colors.amber,
                  checkColor: redlight,
                  value: selectedItems.contains(item),
                  title: Text(item, style: TextStyle(color: white),),
                  onChanged: (checked) => _onItemCheckedChange(item, checked ?? false),
                );
              }).toList(),
            ),
          ),
          actions: [
            TextButton(
              child: const Text("Done", style: TextStyle(color: white),),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: _showMultiSelectDialog,
            child: Container(
              width: double.infinity, 
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: blacklight),
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: selectedItems.isEmpty
                  ? const Text(
                      "Select Sub Category",
                      style: TextStyle(color: black),
                    )
                  : Wrap(
                      spacing: 8.0,
                      runSpacing: 4.0,
                      children: selectedItems.map((item) {
                        return Chip(
                          label: Text(item),
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
      ),
    );
  }
}
