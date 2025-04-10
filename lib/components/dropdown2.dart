
import 'package:flutter/material.dart';
import 'package:autobazzaar/core/theme/colors.dart';
import 'package:autobazzaar/models/drop_down_item.dart';

class DropDownComponent1 extends StatelessWidget {
  final String title1;
  final List<DropdownItem> items1;
  final Function(int) onChanged1;
  final int? selectedIndex1;

  const DropDownComponent1({
    super.key,
    required this.title1,
    required this.items1,
    required this.onChanged1,
    this.selectedIndex1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title1,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: blacklight),
            borderRadius: BorderRadius.circular(10),
          ),
          width: double.infinity,
          child: DropdownButtonFormField<int>(
            value: items1.any((item) => item.id == selectedIndex1) ? selectedIndex1 : null,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            ),
            hint: Text("Select $title1"),
            icon: Icon(Icons.arrow_drop_down, color: Colors.black),
            items: items1.map((item) {
              return DropdownMenuItem<int>(
                value: item.id,
                child: Text(item.name),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                onChanged1(value);
              }
            },
          ),
        ),
      ],
    );
  }
}
