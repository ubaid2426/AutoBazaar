import 'package:autobazzaar/core/theme/colors.dart';
import 'package:flutter/material.dart';

class ColorSelectionSection extends StatefulWidget {
  final String title;
  final List<Map<String, dynamic>> colors;

  const ColorSelectionSection({
    Key? key,
    required this.title,
    required this.colors,
  }) : super(key: key);

  @override
  State<ColorSelectionSection> createState() => _ColorSelectionSectionState();
}

class _ColorSelectionSectionState extends State<ColorSelectionSection> {
  String selectedColorName = 'All';
  bool _showAll = false;

  @override
  Widget build(BuildContext context) {
    final displayColors =
        _showAll ? widget.colors : widget.colors.take(9).toList();

    return Card(
      color: lightgrey,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                color: black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                _buildColorBox("All", Colors.transparent, true),
                for (var item in displayColors)
                  _buildColorBox(item["name"], item["color"], false),
              ],
            ),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () {
                setState(() {
                  _showAll = !_showAll;
                });
              },
              child: Row(
                children: [
                  Text(
                    _showAll ? "Less Color" : "More Color",
                    style: const TextStyle(
                      color: redlight,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Icon(Icons.add, color: redlight),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColorBox(String name, Color color, bool isAll) {
    final isSelected = selectedColorName == name;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColorName = name;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? redlight : white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? redlight : Colors.grey.shade700,
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isAll)
              Icon(
                Icons.more_horiz,
                color: isSelected ? white : Colors.blueAccent,
                size: 18,
              )
            else
              Container(
                width: 14,
                height: 14,
                margin: const EdgeInsets.only(right: 6),
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 1),
                ),
              ),
            Text(
              name,
              style: TextStyle(
                color: black,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
