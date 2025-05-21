import 'package:autobazzaar/core/theme/colors.dart';
import 'package:flutter/material.dart';

class FuelFilter extends StatelessWidget {
  final String title;
  final List<String> options;
  final String? selectedFuel;
  final ValueChanged<String>? onSelected;

  const FuelFilter({
    super.key,
    required this.title,
    required this.options,
    this.selectedFuel,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return _buildCard(
      title: title,
      children: options.map((fuel) => _choiceChip(fuel)).toList(),
    );
  }

  Widget _choiceChip(String label) {
    return ChoiceChip(
      label: Text(label, style: TextStyle(color: black)),
      selected: selectedFuel == label,
      selectedColor: redlight,
      backgroundColor: white,
      onSelected: (_) {
        onSelected!(label);
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
  }

  Widget _buildCard({required String title, required List<Widget> children}) {
    return Card(
      color: lightgrey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Wrap(spacing: 8, runSpacing: 8, children: children),
          ],
        ),
      ),
    );
  }
}
