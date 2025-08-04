import 'package:bcci_platform/presentation/screens/discipleship_pathways_page/widgets/section_card.dart';
import 'package:flutter/material.dart';

class SectionCardWrapper extends StatefulWidget {
  final String title;
  final String subText;
  const SectionCardWrapper({
    super.key,
    required this.title,
    required this.subText,
  });

  @override
  State<SectionCardWrapper> createState() => _SectionCardWrapperState();
}

class _SectionCardWrapperState extends State<SectionCardWrapper> {
  bool isCourseActive = false;

  void toggleCourseActive() {
    setState(() {
      isCourseActive = !isCourseActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: widget.title,
      subText: widget.subText,
      isCourseActive: isCourseActive,
      onToggleActive: toggleCourseActive,
    );
  }
}
