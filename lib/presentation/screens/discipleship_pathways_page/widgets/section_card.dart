import 'package:bcci_platform/core/widgets/custom_background.dart';
import 'package:bcci_platform/presentation/screens/discipleship_pathways_page/widgets/course_modules.dart';
import 'package:bcci_platform/presentation/screens/discipleship_pathways_page/widgets/progress_item.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_gap.dart';

class SectionCard extends StatelessWidget {
  final String title;
  final String subText;
  final bool isCourseActive;

  const SectionCard({
    super.key,
    required this.title,
    required this.subText,
    this.isCourseActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: CustomBackground(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Gap(5),
            Text(
              subText,
              style: TextStyle(color: Colors.black54, fontSize: 15),
            ),
            Gap(16),
            ProgressItem(week: '4', progress: .60, level: 'Beginner'),
            if (isCourseActive) ...[
              Gap(16),
              CourseModules(
                title: 'Understanding Salvation',
                subText: 'Learn about God’s gift of salvation',
                type: 'Video',
                duration: '30 mins',
                status: 'Review',
              ),
              CourseModules(
                title: 'Prayer Basics',
                subText: 'How to communicate with God',
                type: 'Reading',
                duration: '20 mins',
                status: 'Start',
              ),
              CourseModules(
                title: 'Bible Study Methods',
                subText: 'Effective ways to study scripture',
                type: 'Video',
                duration: '30 mins',
                status: 'Start',
              ),
            ],
          ],
        ),
      ),
    );
  }
}
