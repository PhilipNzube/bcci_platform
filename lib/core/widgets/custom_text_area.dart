import 'package:flutter/material.dart';

class CustomTextArea extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final ValueChanged<String>? onChanged;
  final double borderRadius;
  final bool hasShadow;
  final Color shadowColor;
  final int maxLines;
  final Color fillColor;

  const CustomTextArea({
    super.key,
    this.controller,
    this.labelText,
    this.onChanged,
    this.borderRadius = 12,
    this.hasShadow = true,
    this.shadowColor = const Color(0x1F000000),
    this.maxLines = 4,
    this.fillColor = const Color(0xFFFAFAFA),
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
        controller: controller,
        maxLines: maxLines,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          filled: true,
          fillColor: fillColor,
          contentPadding: const EdgeInsets.all(12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: const BorderSide(color: Colors.black),
          ),
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
