import 'package:bcci_platform/core/widgets/custom_gap.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String img;
  final String text;
  final void Function()? onPressed;

  const CustomButton({
    super.key,
    required this.img,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFC7002B),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            img,
            width: 25,
            height: 25,
            color: Colors.white,
            fit: BoxFit.contain,
          ),
          Gap(5, isHorizontal: true),
          Text(text, style: TextStyle(color: Colors.white, fontSize: 16)),
        ],
      ),
    );
  }
}
