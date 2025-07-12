import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_gap.dart';

class ActionCard extends StatelessWidget {
  final String label;
  final String img;

  const ActionCard({super.key, required this.label, required this.img});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(color: Colors.black12, spreadRadius: 3, blurRadius: 6),
          ],
        ),
        child: Column(
          children: [
            Image.asset(img, height: 30, width: 30),
            Gap(10),
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
