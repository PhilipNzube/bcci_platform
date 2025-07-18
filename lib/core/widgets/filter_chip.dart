import 'package:flutter/material.dart';
import 'custom_gap.dart';
import 'custom_background.dart';

class FilterChipWidget extends StatelessWidget {
  final String title;
  final String? badgeText;
  final ValueNotifier<String?>? selectedFilter;
  final VoidCallback? onTap;
  final double? width;
  final double? height;

  const FilterChipWidget({
    super.key,
    required this.title,
    this.badgeText,
    this.selectedFilter,
    this.onTap,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final isSelectable = selectedFilter != null;

    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: ValueListenableBuilder<String?>(
        valueListenable: selectedFilter ?? ValueNotifier(null),
        builder: (context, selectedTitle, _) {
          final isSelected = isSelectable && selectedTitle == title;

          return GestureDetector(
            onTap: () {
              if (isSelectable) {
                selectedFilter!.value = title;
              }
              if (onTap != null) onTap!();
            },
            child: SizedBox(
              width: width,
              height: height,
              child: Stack(
                children: [
                  CustomBackground(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: isSelected ? 0 : 1,
                        blurRadius: isSelected ? 0 : 1,
                      ),
                    ],
                    child: Center(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'GolosText',
                          color: isSelected
                              ? const Color(0xFFFF725E)
                              : Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  if (badgeText != null && badgeText!.isNotEmpty)
                    Positioned(
                      top: 4,
                      right: 4,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF0000),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          badgeText!,
                          style: const TextStyle(
                            fontSize: 8,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
