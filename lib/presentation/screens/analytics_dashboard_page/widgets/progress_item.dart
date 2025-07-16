import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_gap.dart';

class ProgressItem extends StatelessWidget {
  final String title;
  final String img;
  final double progress;
  final Color color;

  const ProgressItem({
    super.key,
    required this.title,
    required this.img,
    required this.progress,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8),
              Image.asset(img, height: 16, width: 16),
            ],
          ),
          Gap(6),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(color),
              minHeight: 10,
            ),
          ),
          Gap(4),
          Text(
            "${(progress * 100).toInt()}%",
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
