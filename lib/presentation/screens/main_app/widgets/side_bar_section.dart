import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_gap.dart';

class SideBarSection extends StatelessWidget {
  final String header;
  final List<Widget> items;

  const SideBarSection({super.key, required this.header, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24, bottom: 8),
          child: Text(
            header,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ),
        ...items,
      ],
    );
  }
}
