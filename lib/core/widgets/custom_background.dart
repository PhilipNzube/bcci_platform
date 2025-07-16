import 'package:flutter/material.dart';

class CustomBackground extends StatelessWidget {
  final Widget? child;
  final double? width;
  final Color color;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final List<BoxShadow> boxShadow;
  const CustomBackground({
    super.key,
    this.child,
    this.width,
    this.color = Colors.white,
    this.margin,
    this.padding = const EdgeInsets.all(16),
    this.borderRadius = 5,
    this.boxShadow = const [
      BoxShadow(color: Colors.black12, spreadRadius: 3, blurRadius: 6),
    ],
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: boxShadow,
      ),
      child: child,
    );
  }
}
