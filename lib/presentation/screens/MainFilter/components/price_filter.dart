import 'package:autobazzaar/core/theme/colors.dart';
import 'package:flutter/material.dart';

class PriceFilter extends StatefulWidget {
  const PriceFilter({super.key});

  @override
  State<PriceFilter> createState() => _PriceFilterState();
}

class _PriceFilterState extends State<PriceFilter> {
  double minPrice = 0;
  double maxPrice = 100000;
  RangeValues priceRange = const RangeValues(0, 100000);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: lightgrey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Price', style: TextStyle(color: black, fontWeight: FontWeight.bold)),
              Text('KWD', style: TextStyle(color: black)),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildPriceField('Min Price', priceRange.start.toInt().toString()),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _buildPriceField('Max Price', priceRange.end == 100000 ? 'All' : priceRange.end.toInt().toString()),
              ),
            ],
          ),
          const SizedBox(height: 16),
          RangeSlider(
            values: priceRange,
            min: 0,
            max: 100000,
            divisions: 100,
            activeColor: redlight,
            inactiveColor: blackColor,
            labels: RangeLabels(
              '${priceRange.start.toInt()}',
              priceRange.end == 100000 ? 'All' : '${priceRange.end.toInt()}',
            ),
            onChanged: (RangeValues values) {
              setState(() {
                priceRange = values;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPriceField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: black)),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(255, 43, 39, 54)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(value, style: const TextStyle(color: black)),
        ),
      ],
    );
  }
}
