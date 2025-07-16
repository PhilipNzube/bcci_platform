import 'package:bcci_platform/core/widgets/custom_background.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_gap.dart';

class FilterCard extends StatelessWidget {
  final String title;
  final ValueNotifier<String?> selectedFilter;

  const FilterCard({
    super.key,
    required this.title,
    required this.selectedFilter,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String?>(
      valueListenable: selectedFilter,
      builder: (context, selectedTitle, child) {
        final isSelected = title == selectedTitle;
        return GestureDetector(
          onTap: () {
            selectedFilter.value = title;
          },
          child: CustomBackground(
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: isSelected ? 0 : 1,
                blurRadius: isSelected ? 0 : 1,
              ),
            ],
            child: Text(
              title,
              style: TextStyle(
                fontSize: 17,
                fontFamily: 'GolosText',
                color: isSelected ? const Color(0xFFFF725E) : Colors.black,
              ),
            ),
          ),
        );
      },
    );
  }
}
