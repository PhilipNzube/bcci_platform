import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_gap.dart';

class FilterChip extends StatelessWidget {
  final String title;
  final String badgeText;

  const FilterChip({super.key, required this.title, required this.badgeText});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 1),
            ],
          ),
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontFamily: 'GolosText'),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(
              color: Color(0xFFFF0000),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              badgeText,
              style: TextStyle(fontSize: 8, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
