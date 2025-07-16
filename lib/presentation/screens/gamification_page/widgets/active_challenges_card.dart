import 'package:bcci_platform/core/widgets/custom_background.dart';
import 'package:bcci_platform/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_gap.dart';

class ActiveChallengesCard extends StatelessWidget {
  final String title;
  final String subText;
  final String progressBarTitle;
  final String giftPoints;
  final double progress;
  final Color progressColor;
  final String endDate;

  const ActiveChallengesCard({
    super.key,
    required this.title,
    required this.progress,
    required this.progressColor,
    required this.subText,
    required this.progressBarTitle,
    required this.giftPoints,
    required this.endDate,
  });

  @override
  Widget build(BuildContext context) {
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
                    Image.asset(
                      "images/Gift.png",
                      width: 15,
                      height: 15,
                      color: Colors.black,
                      fit: BoxFit.contain,
                    ),
                    Text(
                      "$giftPoints pts",
                      style: TextStyle(color: Colors.black54),
                    ),
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
            ),
            Gap(6),
            Row(
              children: [
                Text(
                  "$progressBarTitle Participants",
                  style: TextStyle(
                    fontSize: 14,
                    color: progressColor,
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
            Gap(6),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation<Color>(progressColor),
                minHeight: 10,
              ),
            ),
            Gap(6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    endDate,
                    style: TextStyle(color: Color(0xFF757575), fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  ),
                ),
                CustomButton(
                  text: "Continue",
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
