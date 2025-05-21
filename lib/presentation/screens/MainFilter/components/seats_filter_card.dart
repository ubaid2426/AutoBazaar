import 'package:autobazzaar/core/theme/colors.dart';
import 'package:flutter/material.dart';

class SeatsFilter extends StatefulWidget {
  const SeatsFilter({super.key});

  @override
  State<SeatsFilter> createState() => _SeatsFilterState();
}

class _SeatsFilterState extends State<SeatsFilter> {
  final List<String> seatOptions = [
    'All', '2', '3', '4', '5', '6', '7', '8', '9', 'More than 9'
  ];

  String selectedSeat = 'All';

  @override
  Widget build(BuildContext context) {
    return _buildCard(
      title: "Number of Seats",
      children: seatOptions.map((seat) => _choiceChip(seat)).toList(),
    );
  }

  Widget _choiceChip(String label) {
    return ChoiceChip(
      label: Text(label, style: TextStyle(color: black)),
      selected: selectedSeat == label,
      selectedColor: redlight,
      backgroundColor: white,
      onSelected: (_) {
        setState(() {
          selectedSeat = label;
        });
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
            Text(title, style: TextStyle(color: black, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Wrap(spacing: 8, runSpacing: 8, children: children),
          ],
        ),
      ),
    );
  }
}
