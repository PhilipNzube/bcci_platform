import 'package:bcci_platform/core/widgets/custom_background.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_gap.dart';

class InfoCard extends StatelessWidget {
  final String value;
  final String label;
  final String img;
  final Color iconColor;

  const InfoCard({
    super.key,
    required this.value,
    required this.label,
    required this.img,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomBackground(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            Image.asset(
              img,
              width: 34,
              height: 34,
              fit: BoxFit.contain,
              color: iconColor,
            ),
            Gap(10),
            Text(
              value,
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
