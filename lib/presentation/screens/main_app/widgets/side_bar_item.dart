import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_gap.dart';

class SideBarItem extends StatelessWidget {
  final String label;
  final String iconPath;
  final void Function(String label)? onItemTap;

  const SideBarItem({
    super.key,
    required this.label,
    required this.iconPath,
    this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Image.asset(iconPath, width: 24),
      title: Text(label, style: const TextStyle(fontSize: 14)),
      onTap: () => onItemTap?.call(label),
    );
  }
}
