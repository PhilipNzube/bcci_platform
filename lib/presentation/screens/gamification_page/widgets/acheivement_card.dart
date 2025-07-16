import 'package:bcci_platform/core/widgets/custom_background.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_gap.dart';

class AcheivementCard extends StatelessWidget {
  final String iconType;
  final String badgeText;
  final String title;
  final String subText;
  final String earnedTimeStamp;
  final String points;
  final String progressBarTitle;
  final double progress;
  final Color progressColor;

  const AcheivementCard({
    super.key,
    required this.iconType,
    required this.title,
    required this.badgeText,
    required this.subText,
    required this.earnedTimeStamp,
    required this.points,
    required this.progressBarTitle,
    required this.progress,
    required this.progressColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: CustomBackground(
        padding: const EdgeInsets.all(14),
        borderRadius: 10,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (iconType == "Prayer") ...[
              Image.asset(
                "images/Prayer.png",
                width: 34,
                height: 34,
                fit: BoxFit.contain,
              ),
            ] else if (iconType == "Reading") ...[
              Image.asset(
                "images/Scripture.png",
                width: 34,
                height: 34,
                fit: BoxFit.contain,
              ),
            ] else if (iconType == "Attendance") ...[
              Image.asset(
                "images/Church.png",
                width: 34,
                height: 34,
                fit: BoxFit.contain,
              ),
            ],
            Gap(15, isHorizontal: true),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'GolosText',
                        color: Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      softWrap: false,
                    ),
                    Gap(2, isHorizontal: true),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFBFFF),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        badgeText,
                        style: TextStyle(fontSize: 8, color: Color(0xFF800080)),
                      ),
                    ),
                    Spacer(),
                    Text("$points pts", style: TextStyle(color: Colors.black)),
                  ],
                ),
                Text(
                  subText,
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'GolosText',
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  softWrap: true,
                ),
                const Gap(10),
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
                      "${(progress * 5).toInt()}/5",
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
