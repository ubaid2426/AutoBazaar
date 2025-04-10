import 'package:flutter/material.dart';

class ImageDisplay extends StatelessWidget {
  final String imagePath; // Can be a URL or Asset path
  final double height;
  final double width;
  final BoxFit fit;

  const ImageDisplay({
    super.key,
    required this.imagePath,
    this.height = 150, // Default height
    this.width = 150,  // Default width
    this.fit = BoxFit.cover, // Default fit
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10), // Rounded corners
      child: imagePath.startsWith('http')
          ? Image.network(
              imagePath,
              height: height,
              width: width,
              fit: fit,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(child: CircularProgressIndicator());
              },
              errorBuilder: (context, error, stackTrace) {
                return _errorImage();
              },
            )
          : Image.asset(
              imagePath,
              height: height,
              width: width,
              fit: fit,
              errorBuilder: (context, error, stackTrace) {
                return _errorImage();
              },
            ),
    );
  }

  Widget _errorImage() {
    return Container(
      height: height,
      width: width,
      color: Colors.grey[300], // Placeholder color
      child: const Icon(Icons.broken_image, color: Colors.grey, size: 40),
    );
  }
}
