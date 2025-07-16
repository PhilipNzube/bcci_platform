import 'package:bcci_platform/core/widgets/custom_background.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_gap.dart';

class QuickAction extends StatelessWidget {
  final String title;
  final String subText;

  const QuickAction({super.key, required this.title, required this.subText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: CustomBackground(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 20),
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  ),
                  Text(
                    subText,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF757575),
                    ),
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  ),
                ],
              ),
            ),

            Image.asset(
              "images/arrow-forward.png",
              width: 34,
              height: 34,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
