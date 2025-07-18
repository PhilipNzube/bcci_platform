import 'package:flutter/material.dart';

class NotificationPageController extends ChangeNotifier {
  final ValueNotifier<String?> selectedFilter = ValueNotifier<String?>("All");

  NotificationPageController() {
    selectedFilter.addListener(notifyListeners);
  }

  @override
  void dispose() {
    selectedFilter.removeListener(notifyListeners);
    selectedFilter.dispose();
    super.dispose();
  }
}
