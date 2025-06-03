import 'package:autobazzaar/presentation/screens/PostScreens/components/brand_show.dart';
import 'package:flutter/material.dart';

class CarMakeFilter extends StatelessWidget {
  final String type;
  const CarMakeFilter({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BrandScreen(type: type, filteruse: true, category: 'extra',)),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey.shade200,
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Select Make, Model, Trim'),
            Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
    );
  }
}
