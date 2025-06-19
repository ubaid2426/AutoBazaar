import 'package:autobazzaar/core/theme/colors.dart';
import 'package:autobazzaar/data/models/dummy_data.dart';
import 'package:flutter/material.dart';

class BodyTypeFilter extends StatefulWidget {
  const BodyTypeFilter({super.key});

  @override
  State<BodyTypeFilter> createState() => _BodyTypeFilterState();
}

class _BodyTypeFilterState extends State<BodyTypeFilter> {
  // final List<Map<String, dynamic>> bodyTypes = [
  //   {"title": "All", "image": "assets/images/bodytype/all.png"},
  //   {"title": "Bus - Van", "image": "assets/images/bodytype/van.png"},
  //   {"title": "Convertible", "image": "assets/images/bodytype/convertible.png"},
  //   {"title": "Coupe", "image": "assets/images/bodytype/coupe.png"},
  //   {"title": "HatchBack", "image": "assets/images/bodytype/hatchback.png"},
  //   {"title": "PickUp", "image": "assets/images/bodytype/pickup.png"},
  //   {"title": "Sedan", "image": "assets/images/bodytype/sedan.png"},
  //   {"title": "SUV", "image": "assets/images/bodytype/suv.png"},
  //   {"title": "Truck", "image": "assets/images/bodytype/truck.png"},
  // ];

  String selectedBodyType = "All";

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: lightgrey,
      padding: const EdgeInsets.all(16),
  decoration: BoxDecoration(
        color: lightgrey, 

        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Body Type", style: TextStyle(color: black, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: bodyTypes.map((item) {
              final isSelected = selectedBodyType == item["title"];
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedBodyType = item["title"];
                  });
                  
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: isSelected ? redlight : white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (item["image"] != null)
                        Image.asset(item["image"], width: 24, height: 24),
                      SizedBox(width: 5),
                      Text(
                        item["title"],
                        style: TextStyle(color: black),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
