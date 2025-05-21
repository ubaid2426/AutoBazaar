import 'package:autobazzaar/core/theme/colors.dart';
import 'package:flutter/material.dart';

class YearFilterWidget extends StatefulWidget {
  const YearFilterWidget({super.key});

  @override
  State<YearFilterWidget> createState() => _YearFilterWidgetState();
}

class _YearFilterWidgetState extends State<YearFilterWidget> {
  RangeValues yearRange = const RangeValues(1970, 2025);

  @override
  Widget build(BuildContext context) {
    final minYearDisplay = yearRange.start <= 1970 ? 'Older than 1970' : yearRange.start.toInt().toString();
    final maxYearDisplay = yearRange.end.toInt().toString();

    return Container(
      color: lightgrey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Year", style: TextStyle(color: black, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Row(
            children: [
              _buildYearBox(minYearDisplay),
              SizedBox(width: 10),
              _buildYearBox(maxYearDisplay),
            ],
          ),
          RangeSlider(
            values: yearRange,
            min: 1960,
            max: 2025,
            divisions: 65,
            labels: RangeLabels(minYearDisplay, maxYearDisplay),
            activeColor: redlight,
            inactiveColor: Colors.white24,
            onChanged: (values) => setState(() => yearRange = values),
          ),
        ],
      ),
    );
  }

  Widget _buildYearBox(String label) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(color: black),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(label, textAlign: TextAlign.center, style: TextStyle(color: black)),
      ),
    );
  }
}
