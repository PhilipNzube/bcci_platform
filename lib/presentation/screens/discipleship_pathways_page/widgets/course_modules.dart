import 'package:bcci_platform/core/widgets/custom_background.dart';
import 'package:bcci_platform/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_gap.dart';

class CourseModules extends StatelessWidget {
  final String title;
  final String subText;
  final String type;
  final String duration;
  final String status;

  const CourseModules({
    super.key,
    required this.title,
    required this.subText,
    required this.type,
    required this.duration,
    required this.status,
  });

  Map<String, dynamic> _getTypeStyle(String type) {
    switch (type.toLowerCase()) {
      case 'quiz':
        return {"image": "images/Tick.png"};
      case 'video':
        return {"image": "images/Start.png"};
      case 'reflection':
        return {"image": "images/Star2.png"};
      default:
        return {"image": "images/Tick.png"};
    }
  }

  @override
  Widget build(BuildContext context) {
    final typeStyle = _getTypeStyle(type);
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: CustomBackground(
        padding: const EdgeInsets.all(14),
        borderRadius: 10,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              typeStyle["image"]!,
              width: 34,
              height: 34,
              fit: BoxFit.contain,
            ),
            Gap(15, isHorizontal: true),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'GolosText',
                      color: Colors.black,
                    ),
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  ),
                  const Gap(5),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          subText,
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'GolosText',
                            color: Colors.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          softWrap: true,
                        ),
                      ),
                      if (status == "Review")
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFFE2E2E2),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            status,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            softWrap: false,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      if (status == "Start")
                        CustomButton(
                          text: "Start",
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          backgroundColor: Colors.black,
                          foregroundColor: Color(0xFFFFFFFF),
                          padding: WidgetStateProperty.all(
                            const EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: 8,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const Gap(5),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 8,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE2E2E2),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          type,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          softWrap: false,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Gap(5, isHorizontal: true),
                      Text(
                        duration,
                        style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'GolosText',
                          color: const Color.fromARGB(124, 0, 0, 0),
                        ),
                        softWrap: false,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
