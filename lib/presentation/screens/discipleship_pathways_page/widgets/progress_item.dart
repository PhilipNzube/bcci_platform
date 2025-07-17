import 'package:bcci_platform/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_gap.dart';

class ProgressItem extends StatelessWidget {
  final String week;
  final double progress;
  final String level;

  const ProgressItem({
    super.key,
    required this.week,
    required this.progress,
    required this.level,
  });

  Map<String, dynamic> _getLevelStyle(String level) {
    switch (level.toLowerCase()) {
      case 'beginner':
        return {
          'textColor': const Color(0xFF008000),
          'containerColor': const Color(0xFFCCFFDD),
        };
      case 'intermediate':
        return {
          'textColor': const Color(0xFFDB9410),
          'containerColor': const Color(0xFFFFFFAE),
        };

      default:
        return {
          'textColor': const Color(0xFF800080),
          'containerColor': const Color(0xFFFFBFFF),
        };
    }
  }

  @override
  Widget build(BuildContext context) {
    final levelStyle = _getLevelStyle(level);
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                decoration: BoxDecoration(
                  color: levelStyle['containerColor'],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  level,
                  style: TextStyle(
                    fontSize: 14,
                    color: levelStyle['textColor'],
                  ),
                  softWrap: false,
                  textAlign: TextAlign.center,
                ),
              ),
              Gap(5, isHorizontal: true),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 6,
                  horizontal: 14,
                ),
                decoration: BoxDecoration(
                  color: Color(0xFFE2E2E2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      "images/history-rounded.png",
                      width: 15,
                      height: 15,
                      color: Colors.black,
                      fit: BoxFit.contain,
                    ),
                    Text(
                      "$week Weeks",
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Gap(5),
          Row(
            children: [
              Text(
                "Progress",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Text(
                "${(progress * 100).toInt()}% Complete",
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
          Gap(8),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
              minHeight: 10,
            ),
          ),
          Gap(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomButton(
                text: "Hide Modules",
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
              ),
              Gap(5, isHorizontal: true),
              CustomButton(
                text: "Continue",
                backgroundColor: Color(0xFFE2E2E2),
                foregroundColor: Colors.black,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
