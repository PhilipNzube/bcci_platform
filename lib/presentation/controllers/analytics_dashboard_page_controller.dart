import 'package:flutter/material.dart' hide CarouselController;

class AnalyticsDashboardPageController extends ChangeNotifier {
  final ValueNotifier<String?> selectedFilter = ValueNotifier<String?>("Week");
  AnalyticsDashboardPageController() {
    selectedFilter.addListener(notifyListeners);
  }

  @override
  void dispose() {
    selectedFilter.removeListener(notifyListeners);
    selectedFilter.dispose();
    super.dispose();
  }
}
