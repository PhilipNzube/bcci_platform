import 'package:bcci_platform/core/widgets/custom_background.dart';
import 'package:bcci_platform/core/widgets/custom_button.dart';
import 'package:bcci_platform/core/widgets/custom_gap.dart';
import 'package:flutter/material.dart';

class AllCellCard extends StatelessWidget {
  final String title;
  final String leader;
  final List<Map<String, dynamic>> stats;
  final String address;
  final String time;
  final int progressCurrent;
  final int progressTotal;
  final List<String> tags;

  const AllCellCard({
    super.key,
    required this.title,
    required this.leader,
    required this.stats,
    required this.address,
    required this.time,
    required this.progressCurrent,
    required this.progressTotal,
    required this.tags,
  });

  Color _getTagColor(String tag) {
    switch (tag.toLowerCase()) {
      case 'general':
        return const Color(0xFFDDDDFF);
      case 'multiplying':
        return const Color(0xFFC7FFC7);
      case 'youth':
        return const Color(0xFFC7FFC7);
      case 'active':
        return const Color(0xFFC7FFC7);
      case 'seniors':
        return const Color(0xFFFFD9FF);
      case 'struggling':
        return const Color(0xFFFFF2D9);
      case 'couples':
        return const Color(0xFFFFDEDE);
      default:
        return const Color(0xFFE0E0E0); // default gray
    }
  }

  Color _getTextColor(String tag) {
    switch (tag.toLowerCase()) {
      case 'general':
        return const Color(0xFF0000FF);
      case 'multiplying':
        return const Color(0xFF008000);
      case 'youth':
        return const Color(0xFF008000);
      case 'active':
        return const Color(0xFF008000);
      case 'seniors':
        return const Color(0xFF800080);
      case 'struggling':
        return const Color(0xFFFFA500);
      case 'couples':
        return const Color(0xFFFF0000);
      default:
        return Colors.black;
    }
  }

  Widget _buildStatCard(String value, String label, {bool colorize = false}) {
    Color valueColor = Colors.black;

    if (colorize) {
      final numeric = int.tryParse(value.replaceAll(RegExp(r'[^\d]'), ''));
      if (numeric != null) {
        valueColor = numeric > 58 ? Colors.green : Colors.red;
      }
    }

    return CustomBackground(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      borderRadius: 12,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: valueColor,
            ),
          ),
          const Gap(4),
          Text(
            label,
            style: const TextStyle(fontSize: 12, color: Colors.black87),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title and tags
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const Gap(4),
                    Text(
                      leader,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: tags
                    .map(
                      (tag) => Container(
                        margin: const EdgeInsets.only(bottom: 6),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: _getTagColor(tag),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          tag,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: _getTextColor(tag),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),

          const Gap(16),

          // Stats Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: stats
                .map(
                  (stat) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: _buildStatCard(
                        stat['value'] ?? '',
                        stat['label'] ?? '',
                        colorize: stat['colorize'] ?? false,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),

          const Gap(16),

          // Location
          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                size: 16,
                color: Colors.grey,
              ),
              const SizedBox(width: 4),
              Text(
                address,
                style: const TextStyle(fontSize: 13, color: Color(0xFF757575)),
              ),
            ],
          ),

          const SizedBox(height: 6),

          // Meeting Time
          Row(
            children: [
              const Icon(
                Icons.calendar_today_outlined,
                size: 16,
                color: Colors.grey,
              ),
              const SizedBox(width: 4),
              Text(
                time,
                style: const TextStyle(fontSize: 13, color: Color(0xFF757575)),
              ),
            ],
          ),

          const Gap(20),

          // Progress
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Health Score",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              Text(
                "$progressCurrent%",
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const Gap(4),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: progressCurrent / progressTotal,
              backgroundColor: Colors.grey.shade300,
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.black87),
              minHeight: 10,
            ),
          ),

          const Gap(16),
          CustomButton(
            img: "images/Add2.png",
            imgColor: Colors.black,
            text: "Add Member",
            fontSize: 15,
            fontWeight: FontWeight.bold,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),

          const Gap(16),
          // Buttons
          Row(
            children: [
              ...[Icons.phone, Icons.chat_bubble_outline].map(
                (icon) => Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: CustomBackground(
                    padding: const EdgeInsets.all(12),
                    borderRadius: 10,

                    child: Icon(icon, size: 18),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
