import 'package:flutter/material.dart';

class CustomLabel extends StatelessWidget {
  final String title;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final double? fontSize;
  final bool isPaddingActive;
  final Color? color;
  final bool? softWrap;
  final TextOverflow? overflow;

  const CustomLabel({
    super.key,
    required this.title,
    this.fontFamily = 'GolosText',
    this.fontWeight,
    this.fontSize = 16.0,
    this.isPaddingActive = false,
    this.color,
    this.softWrap,
    this.overflow,
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
          fontSize: fontSize,
          color: color,
        ),
        softWrap: softWrap,
        overflow: overflow,
      ),
    );
  }
}
