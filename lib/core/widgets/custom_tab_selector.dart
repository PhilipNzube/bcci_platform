import 'package:flutter/material.dart';

class CustomTabSelector extends StatelessWidget {
  final List<String> tabs;
  final int selectedIndex;
  final Function(int) onTabSelected;

  const CustomTabSelector({
    super.key,
    required this.tabs,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(tabs.length, (index) {
          final isSelected = index == selectedIndex;
          final isFirst = index == 0;
          final isLast = index == tabs.length - 1;

          return GestureDetector(
            onTap: () => onTabSelected(index),
            child: Container(
              width: 150, // 🔥 Set fixed width for each tab
              decoration: BoxDecoration(
                color: isSelected ? Colors.white : const Color(0xFFD9D9D9),
                border: Border.all(color: const Color(0xFFBFBFBF)),
                borderRadius: BorderRadius.only(
                  topLeft: isFirst ? const Radius.circular(10) : Radius.zero,
                  bottomLeft: isFirst ? const Radius.circular(10) : Radius.zero,
                  topRight: isLast ? const Radius.circular(10) : Radius.zero,
                  bottomRight: isLast ? const Radius.circular(10) : Radius.zero,
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 14),
              alignment: Alignment.center,
              child: Text(
                tabs[index],
                style: TextStyle(
                  fontFamily: 'GolosText',
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.black : Colors.grey,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
