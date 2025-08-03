import 'package:bcci_platform/core/widgets/custom_gap.dart';
import 'package:bcci_platform/presentation/screens/intro_page/widgets/animated_dots.dart';
import 'package:bcci_platform/presentation/screens/intro_page/widgets/circular_ring_button.dart';
import 'package:bcci_platform/presentation/screens/sign_in_page/sign_in_page.dart';
import 'package:flutter/material.dart';

class IntroCardWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final String subtitle2;
  final bool isLast;
  final VoidCallback onNext;
  final bool isActive;
  final int totalPages;
  final int currentPage;

  const IntroCardWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.subtitle2,
    required this.onNext,
    required this.isLast,
    required this.isActive,
    required this.totalPages,
    required this.currentPage,
  });

  double get progress => (currentPage + 1) / totalPages;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.0),
        boxShadow: [
          BoxShadow(
            blurRadius: 12,
            color: Colors.black12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: Image.asset(imagePath, fit: BoxFit.cover),
            ),
          ),
          Gap(24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(totalPages, (index) {
              return AnimatedDot(isActive: currentPage == index);
            }),
          ),

          Gap(24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'GolosText',
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          Gap(12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: 'GolosText',
                fontSize: 17,
                color: Colors.black,
              ),
            ),
          ),
          Gap(12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              subtitle2,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: 'GolosText',
                fontSize: 17,
                color: Colors.black,
              ),
            ),
          ),
          Gap(24),
          CircularRingButton(
            showProgress: isActive, // pass this prop from parent
            isLast: isLast,
            onTap: onNext,
            progress: progress,
          ),
          Gap(12),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignInPage(key: UniqueKey()),
                ),
              );
            },
            child: Text(
              isLast ? "Next >" : "Skip >",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: 'GolosText',
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
