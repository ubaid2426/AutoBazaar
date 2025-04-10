  import 'package:autobazzaar/core/theme/colors.dart';
import 'package:flutter/material.dart';

Widget buildTextField({
    required String label,
    required String hint,
    required TextEditingController controller,
    required FocusNode focusNode,
    required TextInputType keyboardType,
    required String? Function(String?) validator,
    bool obscureText = false,
   required int maxline ,
    Widget? suffixIcon,
  }) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      maxLines: maxline,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        suffixIcon: suffixIcon,
        labelStyle: TextStyle(color: greyColor, fontSize: 14),
        hintStyle: TextStyle(color: greyColor, fontSize: 14),
        contentPadding: const EdgeInsets.all(15),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }