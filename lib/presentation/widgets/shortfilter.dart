import 'package:auto_size_text/auto_size_text.dart';
import 'package:autobazzaar/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:autobazzaar/data/models/dummy_data.dart'; // this should contain brands, years, and categoryTypes as List<DropdownItem>

class ShortFilter extends StatefulWidget {
  const ShortFilter({super.key});

  @override
  State<ShortFilter> createState() => _ShortFilterState();
}

class _ShortFilterState extends State<ShortFilter> {
  String selectedFilter = 'Brand';
  String searchQuery = '';
  dynamic selectedBrand;
  dynamic selectedYear;
  dynamic selectedType;

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    List<dynamic> displayedItems;

    if (selectedFilter == 'Brand') {
      displayedItems =
          brands
              .where(
                (b) => b.name.toLowerCase().contains(searchQuery.toLowerCase()),
              )
              .toList();
    } else if (selectedFilter == 'Year') {
      displayedItems =
          years
              .where(
                (y) => y.name.toLowerCase().contains(searchQuery.toLowerCase()),
              )
              .toList();
    } else {
      displayedItems =
          bodyTypes1
              .where(
                (t) => t.name.toLowerCase().contains(searchQuery.toLowerCase()),
              )
              .toList();
    }

    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 6)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Filter Tabs
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children:
                  ['Brand', 'Year', 'Type']
                      .map(
                        (filter) => Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: _buildFilterButton(filter),
                        ),
                      )
                      .toList(),
            ),
          ),
          const SizedBox(height: 12),

          // Search Bar
          TextField(
            decoration: InputDecoration(
              hintText: 'Search by ${selectedFilter.toLowerCase()}..',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onChanged: (val) => setState(() => searchQuery = val),
          ),
          const SizedBox(height: 12),

          // Grid (3 rows max, scrollable)
          SizedBox(
            height: 240, // approx 3 rows * 80 height
            child: GridView.builder(
              controller: _scrollController,
              itemCount: displayedItems.length,
              scrollDirection: Axis.horizontal,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1 / 2,
              ),
              itemBuilder: (context, index) {
                final item = displayedItems[index];
                return _buildGridItem(item);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButton(String title) {
    final isSelected = selectedFilter == title;
    return GestureDetector(
      onTap:
          () => setState(() {
            selectedFilter = title;
            searchQuery = '';
          }),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? redlight : Colors.white,
          border: Border.all(color: red),
          borderRadius: BorderRadius.circular(30),
        ),
        child: AutoSizeText(
          minFontSize: 10,
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildGridItem(dynamic item) {
    final bool isSelected =
        (selectedFilter == 'Brand' && selectedBrand == item) ||
        (selectedFilter == 'Year' && selectedYear == item) ||
        (selectedFilter == 'Type' && selectedType == item);

    return GestureDetector(
      onTap: () {
        setState(() {
          if (selectedFilter == 'Brand') {
            selectedBrand = item;
            print('Selected Brand: ${item.name}');
          } else if (selectedFilter == 'Year') {
            selectedYear = item;
            print('Selected Year: ${item.name}');
          } else {
            selectedType = item;
            print('Selected Type: ${item.name}');
          }
        });
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.red.shade50 : Colors.white,
          border: Border.all(
            color: isSelected ? Colors.red : Colors.grey.shade300,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child:
            selectedFilter == 'Brand'
                ? Image.asset(item.imagePath, fit: BoxFit.contain)
                : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (selectedFilter == 'Type')
                      Image.asset(item.imagePath, width: 40, height: 30),
                    // const SizedBox(height: 6),
                    AutoSizeText(
                      item.name,
                      minFontSize: 10,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: isSelected ? Colors.red : Colors.black,
                      ),
                    ),
                  ],
                ),
      ),
    );
  }
}
