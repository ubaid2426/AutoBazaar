import 'package:basic_dropdown_button/basic_dropwon_button_widget.dart';
import 'package:basic_dropdown_button/custom_dropdown_button.dart';
import 'package:flutter/material.dart';

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({
    super.key,
    required this.onChanged, // Renamed `event` to `onChanged`
    required this.currentIndex,
    required this.buttonStyle,
    required this.itemButtonStyle,
    required this.position,
    required this.text,
    required this.itemTextColor,
    required this.itemCount,
    required this.languageItems,
    this.buttonTextStyle,
    this.iconColor,
  });

  final void Function(int) onChanged; // Updated
  final int? currentIndex;
  final ButtonStyle buttonStyle;
  final ButtonStyle itemButtonStyle;
  final DropDownButtonPosition position;
  final String text;
  final TextStyle? buttonTextStyle;
  final Color? iconColor;
  final Color itemTextColor;
  final int itemCount;
  final List<CustomDropDownButtonItem<int>> languageItems;

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  @override
  Widget build(BuildContext context) {
    return CustomDropDownButton<int>(
      buttonStyle: widget.buttonStyle,
      buttonText: widget.text,
      position: widget.position,
      buttonTextStyle: widget.buttonTextStyle,
      menuBackgroundColor: Colors.white,
      menuItems: widget.languageItems,
      menuVerticalSpacing: 12,
      menuPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      menuBorderRadius: BorderRadius.circular(8),
      selectedValue: widget.currentIndex,
      buttonIcon: ({required showedMenu}) =>
          showedMenu
              ? Icon(Icons.arrow_drop_down, color: widget.iconColor)
              : Icon(Icons.arrow_drop_up, color: widget.iconColor),
    );
  }
}
