import 'package:bcci_platform/core/widgets/custom_background.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_gap.dart';

class SummaryCard extends StatelessWidget {
  final String number;
  final String label;

  const SummaryCard({super.key, required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomBackground(
        margin: const EdgeInsets.symmetric(horizontal: 6),
        borderRadius: 14,
        child: Column(
          children: [
            Text(
              number,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Gap(4),
            Text(label, style: const TextStyle(color: Colors.black54)),
          ],
        ),
      ),
    );
  }
}
