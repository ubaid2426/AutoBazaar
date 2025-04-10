import 'package:autobazzaar/core/theme/colors.dart';
import 'package:autobazzaar/models/vehicle_category.dart';
import 'package:flutter/material.dart';
// import 'vehicle_category.dart';

class VehicleCategoryBox extends StatelessWidget {
  final VehicleCategory category;
  final VoidCallback onTap;

  const VehicleCategoryBox({super.key, required this.category, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipPath(
            clipper: DiagonalCurvedClipper(),
            child: Container(
              padding: const EdgeInsets.only(
                  top: 60, left: 10, right: 10, bottom: 10),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    redlight,
                    red,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(
                  category.name,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Positioned(
            top: -20,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 100,
                height: 100,
                child: Image.asset(category.imagePath, fit: BoxFit.contain),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class DiagonalCurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height * 0.2);
    path.quadraticBezierTo(size.width * 0.5, 0, size.width, size.height * 0.8);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}