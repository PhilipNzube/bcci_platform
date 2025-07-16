import 'package:flutter/material.dart' hide CarouselController;

class SettingsPageController extends ChangeNotifier {
  bool _pushNotifications = false;
  bool _newCourseAlert = false;
  bool _useWiFi = true;
  bool _autoDownload = true;

  SettingsPageController();

  //public getters
  bool get pushNotifications => _pushNotifications;
  bool get newCourseAlert => _newCourseAlert;
  bool get useWiFi => _useWiFi;
  bool get autoDownload => _autoDownload;

  void setPushNotifications(bool value) {
    _pushNotifications = value;
    notifyListeners();
  }

  void setNewCourseAlert(bool value) {
    _newCourseAlert = value;
    notifyListeners();
  }

  void setUseWiFi(bool value) {
    _useWiFi = value;
    notifyListeners();
  }

  void setAutoDownload(bool value) {
    _autoDownload = value;
    notifyListeners();
  }
}
