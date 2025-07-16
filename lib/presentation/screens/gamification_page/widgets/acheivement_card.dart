import 'package:bcci_platform/core/widgets/custom_background.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_gap.dart';

class AcheivementCard extends StatelessWidget {
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
            if (badgeText == "Prayer") ...[
              Image.asset(
                "images/Prayer.png",
                width: 34,
                height: 34,
                fit: BoxFit.contain,
              ),
            ] else if (badgeText == "Reading") ...[
              Image.asset(
                "images/Scripture.png",
                width: 34,
                height: 34,
                fit: BoxFit.contain,
              ),
            ] else if (badgeText == "Attendance") ...[
              Image.asset(
                "images/Church.png",
                width: 34,
                height: 34,
                fit: BoxFit.contain,
              ),
            ],
            Gap(15, isHorizontal: true),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        flex: 4,
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'GolosText',
                            color: Colors.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                        ),
                      ),
                      Gap(2, isHorizontal: true),
                      Expanded(
                        flex: 4,
                        child: Container(
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
                            style: TextStyle(
                              fontSize: 10,
                              color: Color(0xFF800080),
                            ),
                            softWrap: false,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Spacer(),
                      Text(
                        "$points pts",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Flexible(
                        flex: 4,
                        child: Text(
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
                      ),
                      Spacer(),
                      Text(
                        earnedTimeStamp,
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(0xFF008000),
                        ),
                      ),
                    ],
                  ),
                  if (badgeText == "Attendance") ...[
                    const Gap(10),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          progressBarTitle,
                          style: TextStyle(fontSize: 12, color: progressColor),
                        ),
                        Spacer(),
                        Text(
                          "${(progress * 5).round()}/5",
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
                        valueColor: AlwaysStoppedAnimation<Color>(
                          progressColor,
                        ),
                        minHeight: 10,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
