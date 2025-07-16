import 'package:bcci_platform/core/widgets/custom_background.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_gap.dart';

class TransformationCard extends StatelessWidget {
  final String img;
  final String title;
  final String subText;
  final String progressBarTitle;
  final String progressBarSuffixTitle;
  final double progress;
  final Color progressColor;
  final String status;

  const TransformationCard({
    super.key,
    required this.title,
    required this.img,
    required this.subText,
    required this.progressBarTitle,
    required this.progress,
    required this.progressColor,
    required this.progressBarSuffixTitle,
    required this.status,
  });

  Map<String, dynamic> _getStatusStyle(String status) {
    switch (status.toLowerCase()) {
      case 'in progress':
        return {
          'textColor': const Color(0xFF0000FF),
          'containerColor': const Color(0xFFC4C4FF),
        };
      case 'planning':
        return {
          'textColor': const Color(0xFF000000),
          'containerColor': const Color(0xFFC4C4C4),
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
    final statusStyle = _getStatusStyle(status);
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: CustomBackground(
        padding: const EdgeInsets.all(14),
        borderRadius: 10,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(img, width: 34, height: 34, fit: BoxFit.contain),
            Gap(15, isHorizontal: true),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
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

                      Text(
                        "${(progress * 100).toInt()}%",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  const Gap(5),
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
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        progressBarTitle,
                        style: TextStyle(fontSize: 12, color: progressColor),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          " $progressBarSuffixTitle",
                          style: TextStyle(fontSize: 12, color: progressColor),
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 8,
                        ),
                        decoration: BoxDecoration(
                          color: statusStyle['containerColor'],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          status,
                          style: TextStyle(
                            fontSize: 10,
                            color: statusStyle['textColor'],
                          ),
                          softWrap: false,
                          textAlign: TextAlign.center,
                        ),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
