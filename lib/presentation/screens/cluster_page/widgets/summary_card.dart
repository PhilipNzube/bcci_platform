import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_gap.dart';

class SummaryCard extends StatelessWidget {
  final String number;
  final String label;

  const SummaryCard({super.key, required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(color: Colors.black12, spreadRadius: 3, blurRadius: 6),
          ],
        ),
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
