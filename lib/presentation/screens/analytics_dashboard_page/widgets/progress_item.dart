import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_gap.dart';

class ProgressItem extends StatelessWidget {
  final String title;
  final double progress;

  const ProgressItem({super.key, required this.title, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),

          Gap(6),
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.grey[200],
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                    minHeight: 10,
                  ),
                ),
              ),
              Gap(20, isHorizontal: true),
              Text("/200", style: const TextStyle(fontSize: 12)),
            ],
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
