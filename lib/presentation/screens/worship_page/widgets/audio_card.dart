import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_gap.dart';

class AudioCard extends StatelessWidget {
  final String iconType;
  final String title;
  final String teamTitle;
  final String duration;

  const AudioCard({
    super.key,
    required this.iconType,
    required this.title,
    required this.teamTitle,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: Colors.black12, spreadRadius: 3, blurRadius: 6),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (iconType == "Music") ...[
              Image.asset(
                "images/Music.png",
                width: 34,
                height: 34,
                fit: BoxFit.contain,
              ),
            ] else if (iconType == "Voice") ...[
              Image.asset(
                "images/Voice_Record.png",
                width: 34,
                height: 34,
                fit: BoxFit.contain,
              ),
            ] else if (iconType == "Reading") ...[
              Image.asset(
                "images/Prayer_Team.png",
                width: 34,
                height: 34,
                fit: BoxFit.contain,
              ),
            ],
            Gap(15, isHorizontal: true),

            /// This `Expanded` makes the text column take remaining space
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Amazing Grace",
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'GolosText',
                      color: Colors.black,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: false,
                  ),
                  Text(
                    "Worship Team",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'GolosText',
                      color: Colors.black,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: false,
                  ),
                  Gap(10),
                  Text(
                    "Song (4:00)",
                    style: TextStyle(
                      fontSize: 10,
                      fontFamily: 'GolosText',
                      color: Colors.black,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: false,
                  ),
                ],
              ),
            ),

            Gap(10, isHorizontal: true),

            // Action buttons column (no need for Expanded here)
            Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      "images/Play.png",
                      width: 34,
                      height: 34,
                      fit: BoxFit.contain,
                    ),
                    Gap(10, isHorizontal: true),
                    Image.asset(
                      "images/Like.png",
                      width: 34,
                      height: 34,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
                Gap(8),
                Image.asset(
                  "images/Upload.png",
                  width: 75,
                  height: 34,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
