import 'package:bcci_platform/core/widgets/custom_background.dart';
import 'package:bcci_platform/core/widgets/custom_gap.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final String hintText;
  final TextStyle hintStyle;
  final Widget prefixIcon;
  final void Function()? onTap;

  const SearchBarWidget({
    super.key,
    required this.hintText,
    required this.hintStyle,
    required this.prefixIcon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomBackground(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: TextField(
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: hintStyle,
                prefixIcon: prefixIcon,
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
        Gap(10, isHorizontal: true),
        InkWell(
          onTap: onTap,
          child: Image.asset('images/filter.png', height: 50),
        ),
      ],
    );
  }
}
