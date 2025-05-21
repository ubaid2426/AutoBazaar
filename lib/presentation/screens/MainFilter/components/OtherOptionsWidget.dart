import 'package:autobazzaar/core/theme/colors.dart';
import 'package:flutter/material.dart';

class OtherOptionsWidget extends StatefulWidget {
  const OtherOptionsWidget({Key? key}) : super(key: key);

  @override
  State<OtherOptionsWidget> createState() => _OtherOptionsWidgetState();
}

class _OtherOptionsWidgetState extends State<OtherOptionsWidget> {
  final List<String> options = [
    'All',
    'Listings with Price',
    'Listings with Images',
    'Listings with Video',
    'Listings promoted',
    'Shops Listings',
    'Rating 3 stars or higher',
  ];

  final Map<String, bool> _selected = {};

  @override
  void initState() {
    super.initState();
    for (var option in options) {
      _selected[option] = false;
    }
  }

  void _handleCheck(String key) {
    setState(() {
      if (key == 'All') {
        final newValue = !_selected[key]!;
        for (var k in _selected.keys) {
          _selected[k] = newValue;
        }
      } else {
        _selected[key] = !_selected[key]!;
        _selected['All'] = _selected.entries
            .where((e) => e.key != 'All')
            .every((e) => e.value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: lightgrey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Other Options",
              style: TextStyle(
                  color: black, fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Column(
              children: options.map((option) {
                return CheckboxListTile(
                  activeColor: redlight,
                  checkboxShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  contentPadding: EdgeInsets.zero,
                  value: _selected[option],
                  onChanged: (_) => _handleCheck(option),
                  title: Text(
                    option,
                    style: const TextStyle(color: black),
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
