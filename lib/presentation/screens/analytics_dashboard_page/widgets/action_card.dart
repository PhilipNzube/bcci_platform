import 'package:bcci_platform/core/widgets/custom_background.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_gap.dart';

class ActionCard extends StatelessWidget {
  final String label;
  final String img;

  const ActionCard({super.key, required this.label, required this.img});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.35,
        child: CustomBackground(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(img, height: 30, width: 30),
              Gap(10),
              Text(
                label,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
