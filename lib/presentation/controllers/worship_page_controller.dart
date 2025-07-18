import 'package:flutter/material.dart' hide CarouselController;

class WorshipPageController extends ChangeNotifier {
  final ValueNotifier<String?> selectedFilter = ValueNotifier<String?>("All");

  WorshipPageController() {
    selectedFilter.addListener(notifyListeners);
  }

  @override
  void dispose() {
    selectedFilter.removeListener(notifyListeners);
    selectedFilter.dispose();
    super.dispose();
  }
}
