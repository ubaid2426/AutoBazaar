import 'package:autobazzaar/core/theme/colors.dart';
import 'package:autobazzaar/presentation/screens/PostScreens/components/number.dart';
import 'package:flutter/material.dart';

class MultiSelectOption1 extends StatefulWidget {
  final Map<String, dynamic> options;
  final bool ispost;
  final String? autotype;
  final String? mainheading;
  final List<String>? subheading;
  final String? name;
  final String? namesub;
  // final List<String> services;
  const MultiSelectOption1({
    super.key,
    required this.options,
    required this.ispost,
    this.autotype,
    this.mainheading,
    this.subheading,
    this.name,
    this.namesub,
    // required this.services,
  });

  @override
  State<MultiSelectOption1> createState() => _MultiSelectOption1State();
}

class _MultiSelectOption1State extends State<MultiSelectOption1> {
  Map<String, Set<String>> selectedItems = {}; // Store selections by category
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    // Initialize selections for each category
    for (var key in widget.options.keys) {
      selectedItems[key] = {};
    }
  }

  void toggleOption(String category, String option) {
    setState(() {
      final selected = selectedItems[category]!;
      if (selected.contains(option)) {
        selected.remove(option);
      } else {
        selected.add(option);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.options);
    final filteredMap = widget.options.map((category, options) {
      final List<String> optionList = List<String>.from(options);
      final filteredOptions =
          optionList
              .where(
                (opt) => opt.toLowerCase().contains(searchQuery.toLowerCase()),
              )
              .toList();
      return MapEntry(category, filteredOptions);
    });

    return Scaffold(
      appBar: AppBar(title: Text("Select Services"), backgroundColor: red),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search services...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) {
                setState(() => searchQuery = value);
              },
            ),
          ),
          Expanded(
            child: ListView(
              children:
                  filteredMap.entries.map((entry) {
                    final category = entry.key;
                    final options = entry.value;
                    if (options.isEmpty)
                      return SizedBox(); // Hide empty categories from filter
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            category,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          ...options.map((option) {
                            final isSelected = selectedItems[category]!
                                .contains(option);
                            return CheckboxListTile(
                              value: isSelected,
                              onChanged: (_) => toggleOption(category, option),
                              title: Text(option),
                              controlAffinity: ListTileControlAffinity.leading,
                            );
                          }),
                          Divider(thickness: 1),
                        ],
                      ),
                    );
                  }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () {
                if (widget.ispost == true) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (_) => PhoneNumberInputScreen(
                            autotype: widget.autotype,
                            mainheading: widget.mainheading,
                            subheading: widget.subheading,
                            services: selectedItems,
                            name: widget.name,
                            namesub: widget.namesub,
                          ),
                    ),
                  );
                } else {
                  Navigator.pop(context, selectedItems);
                }
                // You can pass the selectedItems map back or use it as needed
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: red,
              ),
              child: Text(
                "Apply Filter",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
