import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String title;
  final VoidCallback onViewAll;

  const Header({super.key, required this.title, required this.onViewAll});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton.icon(
                style: TextButton.styleFrom(
                  backgroundColor: const Color(
                    0xFFA3432B,
                  ), // Reddish brown color
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                onPressed: onViewAll,
                icon: const Icon(Icons.arrow_forward, size: 18),
                label: const Text('View all'),
              ),
            ],
          ),
        ),
        const Divider(height: 1),
      ],
    );
  }
}
