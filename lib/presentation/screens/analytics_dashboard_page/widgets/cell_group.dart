import 'package:bcci_platform/core/widgets/custom_background.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_gap.dart';

class CellGroup extends StatelessWidget {
  final String title;
  final String members;
  final String stat;
  final String growthStat;

  const CellGroup({
    super.key,
    required this.title,
    required this.members,
    required this.stat,
    required this.growthStat,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: CustomBackground(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  stat,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF008000),
                  ),
                ),
              ],
            ),
            Gap(8),
            // Horizontal row with members and growth
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      "images/Active_Users.png",
                      height: 10,
                      width: 10,
                      color: Colors.black54,
                    ),
                    Gap(4, isHorizontal: true),
                    Text(
                      "$members members",
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                Text(
                  "$growthStat attendance growth",
                  style: const TextStyle(color: Colors.black54, fontSize: 13),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
