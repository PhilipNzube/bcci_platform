import 'package:bcci_platform/core/widgets/custom_gap.dart';
import 'package:flutter/material.dart';

class SettingsOptions extends StatelessWidget {
  final String title;
  final String subTitle;
  final bool? value;
  final void Function(bool)? onChanged;

  const SettingsOptions({
    super.key,
    required this.title,
    required this.subTitle,
    this.value,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'GolosText',
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  softWrap: false,
                ),
                Text(
                  subTitle,
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'GolosText',
                    color: Colors.grey,
                  ),
                  softWrap: true,
                ),
              ],
            ),
          ),

          const Spacer(),
          Switch(
            value: value!,
            onChanged: onChanged, // Toggle the dark mode
          ),
        ],
      ),
    );
  }
}
