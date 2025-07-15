import 'package:flutter/material.dart' hide CarouselController;

class SecuritySettingsPageController extends ChangeNotifier {
  final _formKey = GlobalKey<FormState>();
  String? _password;

  SecuritySettingsPageController();

  //public getters
  GlobalKey<FormState> get formKey => _formKey;
  String? get password => _password;

  void setPassword(String value) {
    _password = value;
    notifyListeners();
  }
}
