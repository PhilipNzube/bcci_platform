import 'package:bcci_platform/core/widgets/custom_background.dart';
import 'package:bcci_platform/core/widgets/custom_gap.dart';
import 'package:bcci_platform/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class AppointmentCard extends StatelessWidget {
  final String fullName;
  final String role;
  final String group;
  final String experience;
  final String nominatedDate;
  final List<String> tags;
  final String status;

  const AppointmentCard({
    super.key,
    required this.fullName,
    required this.role,
    required this.group,
    required this.experience,
    required this.nominatedDate,
    required this.tags,
    required this.status,
  });

  Map<String, dynamic> _getStatStyle(String stat) {
    switch (stat.toLowerCase()) {
      case 'pending':
        return {
          'textColor': Color(0xFFDB9410),
          'containerColor': const Color(0xFFFFFFAE),
        };
      case 'under review':
        return {
          'textColor': Color(0xFF0000FF),
          'containerColor': const Color(0xFFC4C4FF),
        };
      case 'completed':
        return {
          'textColor': const Color(0xFF008000),
          'containerColor': const Color(0xFFADFDAD),
        };

      default:
        return {
          'textColor': const Color(0xFF800080),
          'containerColor': const Color(0xFFFFBFFF),
        };
    }
  }

  @override
  Widget build(BuildContext context) {
    final statStyle = _getStatStyle(status);
    final initials = fullName.isNotEmpty
        ? fullName
              .split(' ')
              .map((e) => e.isNotEmpty ? e[0] : '')
              .take(2)
              .join()
              .toUpperCase()
        : '';

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: CustomBackground(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Row: Avatar, Name, Role, Status
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.grey[200],
                  child: Text(
                    initials,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                const Gap(12, isHorizontal: true),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        fullName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        role,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    color: statStyle['containerColor'],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      color: statStyle['textColor'],
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const Gap(12),
            // Location
            Row(
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  size: 16,
                  color: Color(0xFF757575),
                ),
                const SizedBox(width: 4),
                Text(
                  group,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF757575),
                  ),
                ),
              ],
            ),
            const Gap(6),
            // Experience
            Row(
              children: [
                const Icon(
                  Icons.star_border,
                  size: 16,
                  color: Color(0xFF757575),
                ),
                const SizedBox(width: 4),
                Text(
                  experience,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF757575),
                  ),
                ),
              ],
            ),
            const Gap(6),
            // Nomination Date
            Row(
              children: [
                const Icon(
                  Icons.calendar_today_outlined,
                  size: 16,
                  color: Color(0xFF757575),
                ),
                const SizedBox(width: 4),
                Text(
                  "Nominated: $nominatedDate",
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF757575),
                  ),
                ),
              ],
            ),
            const Gap(12),
            // Tags
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ...tags
                    .take(3)
                    .map(
                      (tag) => Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE2E2E2),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          tag,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                if (tags.length > 3)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE2E2E2),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text("+${tags.length - 3} more"),
                  ),
              ],
            ),
            const Gap(16),
            // Buttons
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: "View Details",
                    fontSize: 14,
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                  ),
                ),
                const Gap(10, isHorizontal: true),
                Expanded(
                  child: CustomButton(
                    text: "Review",
                    fontSize: 14,
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
