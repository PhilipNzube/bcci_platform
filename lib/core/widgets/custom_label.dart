import 'package:flutter/material.dart';

class CustomLabel extends StatelessWidget {
  final String title;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final bool isPaddingActive;
  final Color? color;

  const CustomLabel({
    super.key,
    required this.title,
    this.fontFamily = 'GolosText',
    this.fontWeight,
    this.isPaddingActive = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isPaddingActive ? 20.0 : 0,
        vertical: 8.0,
      ),
      child: Text(
        title,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontWeight: fontWeight ?? FontWeight.bold,
          fontFamily: fontFamily,
          fontSize: 16.0,
          color: color,
        ),
      ),
    );
  }
}
