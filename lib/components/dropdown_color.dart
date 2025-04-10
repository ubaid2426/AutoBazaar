import 'package:autobazzaar/core/theme/colors.dart';
import 'package:flutter/material.dart';

class ColorOption {
  final String title;
  final Color color;

  ColorOption({required this.title, required this.color});
}

class ColorDropdown extends StatefulWidget {
  final String title;
  const ColorDropdown({super.key, required this.title});

  @override
  State<ColorDropdown> createState() => _ColorDropdownState();
}

class _ColorDropdownState extends State<ColorDropdown> {
final List<ColorOption> options = [
  ColorOption(title: "Red", color: Colors.red),
  ColorOption(title: "Green", color: Colors.green),
  ColorOption(title: "Baby Blue", color: Color(0xFF89CFF0)), // Soft blue
  ColorOption(title: "Beige", color: Color(0xFFF5F5DC)), // Beige tone
  ColorOption(title: "Black", color: Colors.black),
  ColorOption(title: "Blue", color: Colors.blue),
  ColorOption(title: "Bronze", color: Color(0xFFCD7F32)), // Bronze tone
  ColorOption(title: "Brown", color: Colors.brown),
  ColorOption(title: "Burgundy", color: Color(0xFF800020)), // Burgundy tone
];


  ColorOption? selectedOption;

  void _showColorPickerPopup() async {
    final selected = await showDialog<ColorOption>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: white,
          title: const Text("Select Color"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: options.map((option) {
                return ListTile(
                  leading: Container(
                    width: 50,
                    height: 20,
                    decoration: BoxDecoration(
                      color: option.color,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  title: Text(option.title),
                  onTap: () {
                    Navigator.of(context).pop(option);
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );

    if (selected != null) {
      setState(() {
        selectedOption = selected;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(widget.title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        GestureDetector(
          onTap: _showColorPickerPopup,
          child: Container(
            // color: white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                if (selectedOption != null)
                  Container(
                    width: 50,
                    height: 20,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: selectedOption!.color,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                Expanded(
                  child: Text(
                    selectedOption?.title ?? 'Select Color',
                    style: TextStyle(
                      fontSize: 16,
                      color: selectedOption != null ? Colors.black : Colors.grey,
                    ),
                  ),
                ),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
