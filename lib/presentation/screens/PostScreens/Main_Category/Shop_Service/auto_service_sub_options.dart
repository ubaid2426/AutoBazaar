import 'package:autobazzaar/core/theme/colors.dart';
import 'package:autobazzaar/presentation/screens/PostScreens/components/number.dart';
import 'package:flutter/material.dart';

class AutoServiceDetailScreen extends StatefulWidget {
  final String categoryTitle;
  final List<String> items;

  const AutoServiceDetailScreen({
    Key? key,
    required this.categoryTitle,
    required this.items,
  }) : super(key: key);

  @override
  State<AutoServiceDetailScreen> createState() => _AutoServiceDetailScreenState();
}

class _AutoServiceDetailScreenState extends State<AutoServiceDetailScreen> {
  final Set<String> _selectedItems = {};

  void _toggleSelection(String item) {
    setState(() {
      if (_selectedItems.contains(item)) {
        _selectedItems.remove(item);
      } else {
        _selectedItems.add(item);
      }
    });
  }

  void _onNextPressed() {
    if (_selectedItems.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => PhoneNumberInputScreen(), // you can also pass selected items
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select at least one option.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.categoryTitle), backgroundColor: red),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: widget.items.length,
              itemBuilder: (context, index) {
                final item = widget.items[index];
                final isSelected = _selectedItems.contains(item);

                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  color: isSelected ? Colors.red.shade50 :white,
                  child: ListTile(
                    title: Text(item),
                    trailing: Icon(
                      isSelected ? Icons.check_circle : Icons.circle_outlined,
                      color: isSelected ? red : Colors.grey,
                    ),
                    onTap: () => _toggleSelection(item),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: red),
                onPressed: _onNextPressed,
                child: const Text("Next", style: TextStyle(color: white, fontSize: 16)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
