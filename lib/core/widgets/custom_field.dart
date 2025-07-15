import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? initialValue;
  final ValueChanged<String>? onChanged;
  final IconData? suffixIcon;
  final String? labelText;

  const CustomTextField({
    super.key,
    this.initialValue,
    this.onChanged,
    this.suffixIcon,
    this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: TextFormField(
        initialValue: initialValue,
        onChanged: onChanged,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelText: labelText,
          labelStyle: const TextStyle(
            color: Colors.grey,
            fontFamily: 'GolosText',
            fontSize: 12.0,
            decoration: TextDecoration.none,
          ),
          filled: true,
          fillColor: Colors.grey[50],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.black),
          ),
          suffixIcon: suffixIcon != null
              ? Icon(suffixIcon, color: Colors.grey[600])
              : null,
        ),
        style: const TextStyle(
          fontFamily: 'GolosText',
          fontSize: 16,
          color: Colors.black87,
        ),
      ),
    );
  }
}
