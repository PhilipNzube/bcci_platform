import 'package:flutter/material.dart' hide CarouselController;

class AcheivementPageController extends ChangeNotifier {
  bool _showLeaderboard = false;
  bool _acheivementNotification = false;
  bool _weeklyReports = true;

  AcheivementPageController();

  //public getters
  bool get showLeaderboard => _showLeaderboard;
  bool get acheivementNotification => _acheivementNotification;
  bool get weeklyReports => _weeklyReports;

  void setShowLeaderboard(bool value) {
    _showLeaderboard = value;
    notifyListeners();
  }

  void setAcheivementNotification(bool value) {
    _acheivementNotification = value;
    notifyListeners();
  }

  void setWeeklyReports(bool value) {
    _weeklyReports = value;
    notifyListeners();
  }
}
