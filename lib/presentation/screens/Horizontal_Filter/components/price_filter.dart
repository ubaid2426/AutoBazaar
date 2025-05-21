import 'package:autobazzaar/core/theme/colors.dart';
import 'package:flutter/material.dart';

class PriceHFilter extends StatefulWidget {
  const PriceHFilter({super.key});

  @override
  State<PriceHFilter> createState() => _PriceHFilterState();
}

class _PriceHFilterState extends State<PriceHFilter> {
  RangeValues _currentRangeValues = const RangeValues(0, 100000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Price Filter', style: TextStyle(color: Colors.white)),
        backgroundColor: red,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Price Range',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 24),
            
            // Price range display boxes
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildPriceBox(_currentRangeValues.start.toInt().toString()),
                _buildPriceBox(
                  _currentRangeValues.end == 100000 
                    ? 'All' 
                    : _currentRangeValues.end.toInt().toString(),
                ),
              ],
            ),
            const SizedBox(height: 16),
            
            // Range slider
            RangeSlider(
              values: _currentRangeValues,
              min: 0,
              max: 100000,
              divisions: 100,
              labels: RangeLabels(
                '${_currentRangeValues.start.toInt()} KWD',
                _currentRangeValues.end == 100000 
                  ? 'All' 
                  : '${_currentRangeValues.end.toInt()} KWD',
              ),
              activeColor: red,
              inactiveColor: red.withOpacity(0.2),
              onChanged: (values) {
                setState(() {
                  _currentRangeValues = values;
                });
              },
            ),
            const SizedBox(height: 8),
            
            // Currency indicator
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                'All prices in KWD',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Apply button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:red,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  // Apply filter logic here
                  Navigator.pop(context, _currentRangeValues);
                },
                child: const Text(
                  'Apply Filter',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceBox(String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        '$value KWD',
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}