import 'package:bcci_platform/core/widgets/custom_background.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_gap.dart';

class AppointmentCard extends StatelessWidget {
  final String title;
  final String subText;
  final String progressBarSuffixText;
  final double progress;
  final String endDate;
  final String badgeText;
  final String status;
  final int progressBarDivisorText;

  const AppointmentCard({
    super.key,
    required this.title,
    required this.progress,
    required this.subText,
    required this.progressBarSuffixText,
    required this.endDate,
    required this.badgeText,
    required this.status,
    required this.progressBarDivisorText,
  });

  Map<String, dynamic> _getStatStyle(String stat) {
    switch (stat.toLowerCase()) {
      case 'in progress':
        return {
          'textColor': Colors.black,
          'containerColor': const Color(0xFFE2E2E2),
        };
      case 'completed':
        return {
          'textColor': const Color(0xFF008000),
          'containerColor': const Color(0xFFADFDAD),
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
    final statStyle = _getStatStyle(status);
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: CustomBackground(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.visibility_outlined, color: Colors.black),
                    Gap(5, isHorizontal: true),
                    Icon(Icons.delete, color: Colors.black),
                  ],
                ),
              ],
            ),
            Gap(6),
            Text(
              subText,
              style: TextStyle(color: Color(0xFF757575), fontSize: 14),
              overflow: TextOverflow.ellipsis,
              softWrap: false,
              maxLines: 2,
            ),
            Gap(6),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 6,
                    horizontal: 14,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFFE2E2E2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    badgeText,
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                ),
                Gap(5, isHorizontal: true),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 8,
                  ),
                  decoration: BoxDecoration(
                    color: statStyle['containerColor'],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      fontSize: 14,
                      color: statStyle['textColor'],
                    ),
                    softWrap: false,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Gap(6),
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
                  "${(progress / progressBarDivisorText * progressBarDivisorText).toInt()}/$progressBarDivisorText $progressBarSuffixText",
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
            Gap(6),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: progress / progressBarDivisorText,
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                minHeight: 10,
              ),
            ),
            Gap(6),
            Text(
              "Deadline: $endDate",
              style: TextStyle(color: Color(0xFF757575), fontSize: 14),
              overflow: TextOverflow.ellipsis,
              softWrap: false,
            ),
          ],
        ),
      ),
    );
  }
}
