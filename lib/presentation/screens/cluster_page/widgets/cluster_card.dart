import 'package:bcci_platform/core/widgets/custom_background.dart';
import 'package:bcci_platform/presentation/screens/cluster_page/widgets/action_button.dart';
import 'package:bcci_platform/presentation/screens/cluster_page/widgets/stat_card.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_gap.dart';

class ClusterCard extends StatelessWidget {
  final String region;
  final String district;
  final int members;
  final int activeCells;
  final int avgPerCell;

  const ClusterCard({
    super.key,
    required this.region,
    required this.district,
    required this.members,
    required this.activeCells,
    required this.avgPerCell,
  });

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      borderRadius: 14,
      child: Column(
        children: [
          // Region Title
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    region,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(district, style: const TextStyle(color: Colors.black54)),
                ],
              ),
              Text(
                "$members Members",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Gap(16),

          // Active Cells and Avg Cells
          Row(
            children: [
              StatCard(number: activeCells.toString(), label: "Active Cells"),
              Gap(10, isHorizontal: true),
              StatCard(number: avgPerCell.toString(), label: "Avg per Cell"),
            ],
          ),
          Gap(16),

          // Buttons
          Row(
            children: [
              Expanded(
                child: ActionButton(
                  label: "View Details",
                  icon: Icons.keyboard_arrow_down,
                ),
              ),
              Gap(10, isHorizontal: true),
              Expanded(
                child: ActionButton(
                  label: "Analytics",
                  icon: Icons.keyboard_arrow_down,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
