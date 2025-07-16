import 'package:flutter/material.dart' hide CarouselController;

class ProfileNotificationPageController extends ChangeNotifier {
  bool _eventReminders = false;
  bool _cellUpdates = false;
  bool _spiritualGoals = true;
  bool _acheivements = true;
  bool _communityNews = false;
  bool _prayerRequest = false;

  ProfileNotificationPageController();

  //public getters
  bool get eventReminders => _eventReminders;
  bool get cellUpdates => _cellUpdates;
  bool get spiritualGoals => _spiritualGoals;
  bool get acheivements => _acheivements;
  bool get communityNews => _communityNews;
  bool get prayerRequest => _prayerRequest;

  void setEventReminders(bool value) {
    _eventReminders = value;
    notifyListeners();
  }

  void setCellUpdates(bool value) {
    _cellUpdates = value;
    notifyListeners();
  }

  void setSpiritualGoals(bool value) {
    _spiritualGoals = value;
    notifyListeners();
  }

  void setAcheivements(bool value) {
    _acheivements = value;
    notifyListeners();
  }

  void setCommunityNews(bool value) {
    _communityNews = value;
    notifyListeners();
  }

  void setPrayerRequest(bool value) {
    _prayerRequest = value;
    notifyListeners();
  }
}
