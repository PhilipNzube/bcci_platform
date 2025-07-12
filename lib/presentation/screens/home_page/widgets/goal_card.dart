import 'package:bcci_platform/presentation/screens/home_page/widgets/progress_item.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_gap.dart';

class GoalCard extends StatelessWidget {
  const GoalCard({super.key});

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
          // Title and View All
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    "images/Spiritual_Goal.png",
                    height: 20,
                    width: 20,
                  ),
                  Gap(8, isHorizontal: true),
                  Text(
                    "Spiritual Goals",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Text("View All", style: TextStyle(color: Colors.black54)),
            ],
          ),
          Gap(20),

          ProgressItem(
            title: "Daily Prayer",
            img: "images/Daily_Prayer.png",
            progress: .85,
            color: Colors.green,
          ),
          ProgressItem(
            title: "Bible Reading",
            img: "images/Bible_Reading.png",
            progress: 0.65,
            color: Colors.red,
          ),
          ProgressItem(
            title: "Community Service",
            img: "images/Community_Service.png",
            progress: 0.65,
            color: Colors.purple,
          ),
        ],
      ),
    );
  }
}
