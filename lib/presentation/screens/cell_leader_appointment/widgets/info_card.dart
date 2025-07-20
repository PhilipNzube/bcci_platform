import 'package:bcci_platform/core/widgets/custom_background.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_gap.dart';

class InfoCard extends StatelessWidget {
  final String value;
  final String label;
  final bool isPercentage;

  const InfoCard({
    super.key,
    required this.value,
    required this.label,
    this.isPercentage = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: CustomBackground(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            Text(
              isPercentage ? '$value%' : value,
              style: const TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
            ),
            Text(
              label,
              style: const TextStyle(fontSize: 14, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
