import 'package:bcci_platform/core/widgets/custom_background.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_gap.dart';

class RecentCard extends StatelessWidget {
  final String title;
  final String subText;
  final String status;
  final String timeStamp;

  const RecentCard({
    super.key,
    required this.title,
    required this.subText,
    required this.status,
    required this.timeStamp,
  });

  Map<String, dynamic> _getStatusStyle(String status) {
    switch (status.toLowerCase()) {
      case 'in progress':
        return {
          'textColor': const Color(0xFF008000),
          'containerColor': const Color(0xFFCCFFDD),
          "image": "images/history-rounded.png",
        };
      case 'planning':
        return {
          'textColor': const Color(0xFF000000),
          'containerColor': const Color(0xFFC4C4C4),
          "image": "images/history-rounded.png",
        };
      case 'completed':
        return {
          'textColor': const Color(0xFF008000),
          'containerColor': const Color(0xFFCCFFDD),
          "image": "images/circle-tick.png",
        };
      default:
        return {
          'textColor': const Color(0xFF800080),
          'containerColor': const Color(0xFFFFBFFF),
          "image": "images/history-rounded.png",
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
            Image.asset(
              statusStyle["image"]!,
              width: 34,
              height: 34,
              fit: BoxFit.contain,
            ),
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
                  const Gap(5),
                  Row(
                    children: [
                      Expanded(
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
                      Text(
                        timeStamp,
                        style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'GolosText',
                          color: Colors.black,
                        ),
                        softWrap: false,
                      ),
                    ],
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
