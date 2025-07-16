import 'package:flutter/material.dart' hide CarouselController;

class PrivacyPageController extends ChangeNotifier {
  bool _profileVisible = false;
  bool _showAttendance = false;
  bool _shareProgress = true;
  bool _allowMessages = true;

  PrivacyPageController();

  //public getters
  bool get profileVisible => _profileVisible;
  bool get showAttendance => _showAttendance;
  bool get shareProgress => _shareProgress;
  bool get allowMessages => _allowMessages;

  void setProfileVisible(bool value) {
    _profileVisible = value;
    notifyListeners();
  }

  void setShowAttendance(bool value) {
    _showAttendance = value;
    notifyListeners();
  }

  void setShareProgress(bool value) {
    _shareProgress = value;
    notifyListeners();
  }

  void setAllowMessages(bool value) {
    _allowMessages = value;
    notifyListeners();
  }
}
