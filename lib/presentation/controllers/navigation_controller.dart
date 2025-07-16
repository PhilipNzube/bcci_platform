import 'package:flutter/material.dart';

class NavigationController extends ChangeNotifier {
  int _selectedIndex = 0;
  int _previousIndex = 0;
  int _tempIndex = -1; // Temporary index for AnalyticsDashboardPage

  int get selectedIndex => _tempIndex >= 0 ? _tempIndex : _selectedIndex;
  int get previousIndex => _previousIndex;
  int get tempIndex => _tempIndex;

  void changeTab(int index) {
    _previousIndex = _selectedIndex;
    _selectedIndex = index;
    notifyListeners();
  }

  void setTempIndex(int index) {
    _previousIndex = _selectedIndex;
    _tempIndex = index;
    notifyListeners();
  }

  void clearTempIndex() {
    _tempIndex = -1;
    notifyListeners();
  }
}
