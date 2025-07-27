import 'package:flutter/material.dart' hide CarouselController;

class CellManagementPageController extends ChangeNotifier {
  int _selectedTabIndex = 0;

  CellManagementPageController();

  //public getters
  int get selectedTabIndex => _selectedTabIndex;

  void setSelectedTabIndex(int value) {
    _selectedTabIndex = value;
    notifyListeners();
  }
}
