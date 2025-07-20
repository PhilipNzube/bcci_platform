import 'package:flutter/material.dart' hide CarouselController;

class CellLeaderAppointmentController extends ChangeNotifier {
  int _selectedTabIndex = 0;

  CellLeaderAppointmentController();

  //public getters
  int get selectedTabIndex => _selectedTabIndex;

  void setSelectedTabIndex(int value) {
    _selectedTabIndex = value;
    notifyListeners();
  }
}
