import 'package:autobazzaar/core/theme/colors.dart';
import 'package:flutter/material.dart';

class ConditionFilterCard extends StatefulWidget {
  final Function(String) onChanged;
  final String selected;

  const ConditionFilterCard({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  State<ConditionFilterCard> createState() => _ConditionFilterCardState();
}

class _ConditionFilterCardState extends State<ConditionFilterCard> {
  final List<String> options = ['All', 'New', 'Used'];

  @override
  Widget build(BuildContext context) {
    return Card(
      color: lightgrey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Condition', style: TextStyle(color: black, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children: options.map((item) {
                final isSelected = item == widget.selected;
                return ChoiceChip(
                  label: Text(item),
                  selected: isSelected,
                  onSelected: (_) => widget.onChanged(item),
                  selectedColor: redlight,
                  labelStyle: TextStyle(color: isSelected ? Colors.black : Colors.white),
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
