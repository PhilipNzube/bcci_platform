import 'package:bcci_platform/presentation/screens/home_page/widgets/event_tile.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_gap.dart';

class UpcomingEventsCard extends StatelessWidget {
  const UpcomingEventsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(color: Colors.black12, spreadRadius: 3, blurRadius: 6),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset("images/Calender.png", height: 20, width: 20),
                  Gap(8, isHorizontal: true),
                  Text(
                    "Upcoming Events",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),
              Text("View All", style: TextStyle(color: Colors.black54)),
            ],
          ),
          Gap(16),
          // Events
          EventTile(
            title: "Sunday Service",
            date: "Jun 22, 2025",
            time: "9:00 AM",
          ),
          Gap(10),
          EventTile(
            title: "Cell Meeting",
            date: "Jun 24, 2025",
            time: "7:00 AM",
          ),
          Gap(10),
          EventTile(
            title: "Youth Conference",
            date: "Jun 28, 2025",
            time: "6:00 AM",
          ),
        ],
      ),
    );
  }
}
