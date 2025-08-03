import 'package:flutter/material.dart';

class CircularRingButton extends StatelessWidget {
  final bool showProgress;
  final bool isLast;
  final VoidCallback onTap;
  final double progress;

  const CircularRingButton({
    super.key,
    required this.showProgress,
    required this.isLast,
    required this.onTap,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: progress),
            duration: const Duration(milliseconds: 500),
            builder: (context, value, child) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 70,
                    width: 70,
                    child: CircularProgressIndicator(
                      value: value,
                      strokeWidth: 2,
                      backgroundColor: Colors.grey.shade300,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Color(0xFFF27025),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 54,
                    width: 54,
                    child: Transform.scale(
                      scale: 2.7,
                      child: Transform.translate(
                        offset: Offset(0, 3.5), // Move up slightly
                        child: ClipOval(
                          child: Image.asset(
                            isLast
                                ? 'images/DoneTick.png'
                                : 'images/WelcomeNextButton.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
