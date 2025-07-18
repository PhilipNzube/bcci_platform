import 'package:bcci_platform/core/widgets/custom_background.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_gap.dart';

class InfoCard extends StatelessWidget {
  final String value;
  final String label;
  final String img;
  final Color iconColor;
  final bool isPercentage;
  final String stat;

  const InfoCard({
    super.key,
    required this.value,
    required this.label,
    required this.img,
    required this.iconColor,
    this.isPercentage = false,
    required this.stat,
  });

  Map<String, dynamic> _getStatStyle(String stat) {
    if (stat.contains("-")) {
      return {
        'textColor': const Color(0xFFFF0000), // Red
        'containerColor': const Color(0xFFFFE5E5), // Light red background
      };
    } else if (stat.contains("+")) {
      return {
        'textColor': const Color(0xFF008000), // Green
        'containerColor': const Color(0xFFCCFFDD), // Light green background
      };
    } else {
      return {
        'textColor': Colors.grey,
        'containerColor': const Color(0xFFE0E0E0),
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    final statStyle = _getStatStyle(stat);
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
            Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              decoration: BoxDecoration(
                color: statStyle['containerColor'],
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                stat,
                style: TextStyle(fontSize: 10, color: statStyle['textColor']),
                softWrap: false,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
