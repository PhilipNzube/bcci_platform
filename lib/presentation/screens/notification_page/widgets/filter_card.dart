import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_gap.dart';

class FilterCard extends StatelessWidget {
  final String title;

  const FilterCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
