import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_gap.dart';

class EngagementProgress extends StatelessWidget {
  final String title;
  final double progress;
  final bool isIncreasing;
  final String upImagePath;
  final String downImagePath;

  const EngagementProgress({
    super.key,
    required this.title,
    required this.progress,
    required this.isIncreasing,
    required this.upImagePath,
    required this.downImagePath,
  });

  @override
  Widget build(BuildContext context) {
    // Select image and color based on trend
    final imagePath = isIncreasing ? upImagePath : downImagePath;
    final color = isIncreasing ? Colors.green : Colors.red;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Title
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // Percentage + Arrow
              Row(
                children: [
                  Image.asset(
                    imagePath,
                    height: 14,
                    width: 14,
                    fit: BoxFit.contain,
                    color: color,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "${(progress * 100).toInt()}%",
                    style: TextStyle(
                      fontSize: 12,
                      color: color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),

          Gap(6),

          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
              minHeight: 10,
            ),
          ),
        ],
      ),
    );
  }
}
