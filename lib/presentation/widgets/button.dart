import 'package:autobazzaar/components/main_filter.dart';
import 'package:autobazzaar/core/theme/colors.dart';
import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  final String title;
  const FilterButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
           Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MainFilter(),
            // builder: (context) => const QiblaApp(),
          ),
        );
      },
      child: Container(
        // width: 100,
        height: 50,
        decoration: BoxDecoration(
          color: redlight, // Main container background
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(50),
            bottom: Radius.circular(50),
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            // spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(title), Icon(Icons.keyboard_arrow_up)],
          ),
        ),
      ),
    );
  }
}
