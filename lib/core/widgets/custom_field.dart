import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? initialValue;
  final ValueChanged<String>? onChanged;
  final IconData? suffixIcon;
  final String? labelText;
  final double borderRadius;
  final bool filled;
  final Color? fillColor;
  final bool hasShadow;
  final Color shadowColor;

  const CustomTextField({
    super.key,
    this.initialValue,
    this.onChanged,
    this.suffixIcon,
    this.labelText,
    this.borderRadius = 15,
    this.filled = true,
    this.fillColor = const Color(0xFFFAFAFA),
    this.hasShadow = true,
    this.shadowColor = const Color(0x1F000000), // default subtle shadow
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: hasShadow
          ? BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: shadowColor,
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
              ],
            )
          : null,
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
          filled: filled,
          fillColor: fillColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
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
