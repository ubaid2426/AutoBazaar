import 'package:autobazzaar/core/theme/colors.dart';
import 'package:flutter/material.dart';

class KilometerFilter extends StatelessWidget {
  final VoidCallback? onTap;

  const KilometerFilter({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () => debugPrint("Kilometer Filter Tapped"),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          color: lightgrey,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Kilometers', style: TextStyle(color: black)),
            Row(
              children: [
                Text('Select', style: TextStyle(color: black)),
                SizedBox(width: 5),
                Icon(Icons.arrow_forward_ios, color: black, size: 16),
              ],
            )
          ],
        ),
      ),
    );
  }
}
