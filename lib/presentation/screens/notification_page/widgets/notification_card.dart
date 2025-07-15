import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_gap.dart';

class NotificationCard extends StatelessWidget {
  final String iconType;
  final String name;
  final String message;
  final String timeStamp;

  const NotificationCard({
    super.key,
    required this.iconType,
    required this.name,
    required this.message,
    required this.timeStamp,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 3,
                  blurRadius: 6,
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (iconType == "Reminder") ...[
                  Image.asset(
                    "images/Calender_Notification.png",
                    width: 34,
                    height: 34,
                    fit: BoxFit.contain,
                  ),
                ] else if (iconType == "Goal") ...[
                  Image.asset(
                    "images/Star.png",
                    width: 34,
                    height: 34,
                    fit: BoxFit.contain,
                  ),
                ],
                const Gap(15, isHorizontal: true),

                /// This `Expanded` makes the text column take remaining space
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'GolosText',
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text(
                        message,
                        style: const TextStyle(
                          fontSize: 15,
                          fontFamily: 'GolosText',
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      const Gap(10),
                      Row(
                        children: [
                          const Icon(
                            Icons.access_time,
                            size: 12,
                            color: Colors.black,
                          ),
                          Gap(4, isHorizontal: true),
                          Text(
                            timeStamp,
                            style: const TextStyle(
                              fontSize: 10,
                              fontFamily: 'GolosText',
                              color: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            top: 8,
            right: 8,
            child: Image.asset('images/More.png', height: 25),
          ),
        ],
      ),
    );
  }
}
