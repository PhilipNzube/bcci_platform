import 'package:bcci_platform/core/widgets/custom_background.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_gap.dart';

class LeaderboardCard extends StatelessWidget {
  final int position;
  final String name;
  final String points;

  const LeaderboardCard({
    super.key,
    required this.position,
    required this.name,
    required this.points,
  });

  /// Returns the badge text and image path for a given position
  Map<String, String>? _getBadgeData(int position) {
    switch (position) {
      case 1:
        return {"text": "Crown", "image": "images/Crown.png"};
      case 2:
        return {"text": "Star", "image": "images/Star.png"};
      case 3:
        return {"text": "Rising Star", "image": "images/Trophy.png"};
      case 4:
        return {"text": "Consistent", "image": "images/Medal.png"};
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final badgeData = _getBadgeData(position);

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: CustomBackground(
        padding: const EdgeInsets.all(14),
        borderRadius: 10,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (badgeData != null) ...[
              Image.asset(
                badgeData["image"]!,
                width: 34,
                height: 34,
                fit: BoxFit.contain,
              ),
              const Gap(5, isHorizontal: true),
            ],
            Text(
              "#$position",
              style: const TextStyle(
                fontSize: 20,
                fontFamily: 'GolosText',
                color: Colors.black,
              ),
            ),
            const Gap(15, isHorizontal: true),

            /// Name and Badge
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'GolosText',
                      color: Colors.black,
                    ),
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  ),
                  const Gap(2),
                  if (badgeData != null)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 8,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFCCFFDD),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        badgeData["text"]!,
                        style: const TextStyle(
                          fontSize: 10,
                          color: Color(0xFF008000),
                        ),
                        softWrap: false,
                        textAlign: TextAlign.center,
                      ),
                    ),
                ],
              ),
            ),

            /// Points
            Column(
              children: [
                Text(
                  points,
                  style: const TextStyle(
                    color: Color(0xFF008000),
                    fontSize: 20,
                  ),
                ),
                const Gap(2),
                const Text(
                  "Points",
                  style: TextStyle(color: Color(0xFF757575), fontSize: 10),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
