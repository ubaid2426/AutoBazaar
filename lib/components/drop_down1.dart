import 'package:autobazzaar/core/theme/colors.dart';
import 'package:autobazzaar/models/drop_down_item.dart';
import 'package:flutter/material.dart';

// class DropdownItem {
//   final int id;
//   final String name;

//   DropdownItem({required this.id, required this.name});
// }

class DropDownComponent extends StatefulWidget {
  final String title;
  final List<DropdownItem> items;
  final int? selectedIndex;
  final Function(int) onChanged;

  const DropDownComponent({
    super.key,
    required this.title,
    required this.items,
    required this.onChanged,
    this.selectedIndex,
  });

  @override
  State<DropDownComponent> createState() => _DropDownComponentState();
}

class _DropDownComponentState extends State<DropDownComponent> {
  DropdownItem? selectedItem;

  void _showDropdownPopup() {
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController _searchController = TextEditingController();
        List<DropdownItem> filteredItems = List.from(widget.items);

        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              backgroundColor: Colors.transparent,
              child: Container(
                height: 300,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [white, white],
                ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    // Search Field
                    TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search ${widget.title}...',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.search),
                      ),
                      onChanged: (value) {
                        setState(() {
                          filteredItems = widget.items
                              .where((item) =>
                                  item.name.toLowerCase().contains(value.toLowerCase()))
                              .toList();
                        });
                      },
                    ),
                    SizedBox(height: 16),
                    // Options List
                    Expanded(
                      child: ListView.builder(
                        itemCount: filteredItems.length,
                        itemBuilder: (context, index) {
                          final item = filteredItems[index];
                          return ListTile(
                            title: Text(item.name),
                            onTap: () {
                              setState(() {
                                selectedItem = item;
                              });
                              widget.onChanged(item.id);
                              Navigator.pop(context);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final placeholderText = selectedItem?.name ??
        widget.items.firstWhere(
              (item) => item.id == widget.selectedIndex,
              orElse: () => DropdownItem(id: -1, name: "Select ${widget.title}"),
            ).name;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        GestureDetector(
          onTap: _showDropdownPopup,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  placeholderText,
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
                Icon(Icons.arrow_drop_down, color: Colors.black),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
