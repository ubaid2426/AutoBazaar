import 'package:flutter/material.dart';

class VehiclesHeader extends StatelessWidget {
  final VoidCallback onSortPressed;
  final VoidCallback onFilterPressed;
  final String title;
  // final String 
  const VehiclesHeader({
    super.key,
    required this.onSortPressed,
    required this.onFilterPressed, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Vehicles Title
           Text(
            title,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          // Sort & Filter Buttons
          Row(
            children: [
              _customButton(
                text: "Sort",
                icon: Icons.swap_vert,
                onPressed: onSortPressed,
              ),
              const SizedBox(width: 8), // Spacing between buttons
              _customButton(
                text: "Filter",
                icon: Icons.filter_list,
                onPressed: onFilterPressed,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _customButton({
    required String text,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 18, color: Colors.black),
      label: Text(
        text,
        style: const TextStyle(color: Colors.black, fontSize: 14),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        elevation: 1,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
