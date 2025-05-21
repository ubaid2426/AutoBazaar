import 'package:autobazzaar/core/theme/colors.dart';
import 'package:autobazzaar/presentation/widgets/button.dart';
import 'package:flutter/material.dart';

class HorizontalJobFilter extends StatelessWidget {
  const HorizontalJobFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width - 80,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 10,
                children: [
                  FilterButton(title: 'Location', filter: true, items: [], options: [],),
                  FilterButton(title: 'Full Time', filter: true, items: [], options: [],),
                  FilterButton(title: 'Latest', filter: true, items: [], options: [],),
                  FilterButton(title: 'Oldest', filter: true, items: [], options: [],),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 45,
            height: 45,
            child: Container(
              decoration: BoxDecoration(
                // color: redlight, // Main container background
                border: Border.all(color: red),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(10),
                  bottom: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: Offset(0, -3),
                  ),
                ],
              ),
              child: Icon(Icons.filter_alt_sharp),
            ),
          ),
        ],
      ),
    );
  }
}
