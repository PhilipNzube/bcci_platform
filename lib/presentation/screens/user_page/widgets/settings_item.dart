import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_gap.dart';

class SettingsItem extends StatelessWidget {
  final String icon;
  final String title;

  const SettingsItem({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: Colors.black12, spreadRadius: 3, blurRadius: 6),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(icon, width: 34, height: 34, fit: BoxFit.contain),
            Gap(15, isHorizontal: true),

            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'GolosText',
                  color: Colors.black,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: false,
              ),
            ),

            Gap(10, isHorizontal: true),

            Image.asset(
              "images/Add.png",
              width: 34,
              height: 34,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
