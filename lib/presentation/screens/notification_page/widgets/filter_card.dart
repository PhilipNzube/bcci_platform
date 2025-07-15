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
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: isSelected ? 0 : 1,
                  blurRadius: isSelected ? 0 : 1,
                ),
              ],
            ),
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
