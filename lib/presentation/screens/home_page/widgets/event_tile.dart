import 'package:bcci_platform/core/widgets/custom_background.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_gap.dart';

class EventTile extends StatelessWidget {
  final String title;
  final String date;
  final String time;

  const EventTile({
    super.key,
    required this.title,
    required this.date,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      padding: const EdgeInsets.all(14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Title and date/time
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gap(4),
              Row(
                children: [
                  Text(date, style: const TextStyle(color: Colors.black54)),
                  Gap(10, isHorizontal: true),
                  Text(time, style: const TextStyle(color: Colors.black54)),
                ],
              ),
            ],
          ),
          // RSVP Button
          Container(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 14),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text("RSVP", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
