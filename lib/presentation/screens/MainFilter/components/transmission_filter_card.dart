import 'package:autobazzaar/core/theme/colors.dart';
import 'package:flutter/material.dart';
class TransmissionFilter extends StatefulWidget {
  const TransmissionFilter({super.key});

  @override
  State<TransmissionFilter> createState() => _TransmissionFilterState();
}

class _TransmissionFilterState extends State<TransmissionFilter> {
  final List<String> transmissionOptions = ['All', 'Automatic', 'Manual'];

  String selectedTransmission = 'All';

  @override
  Widget build(BuildContext context) {
    return _buildCard(
      title: "Transmission",
      children: transmissionOptions.map((option) => _choiceChip(option)).toList(),
    );
  }

  Widget _choiceChip(String label) {
    return ChoiceChip(
      label: Text(label, style: TextStyle(color: black)),
      selected: selectedTransmission == label,
      selectedColor: redlight,
      backgroundColor: white,
      onSelected: (_) {
        setState(() {
          selectedTransmission = label;
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
