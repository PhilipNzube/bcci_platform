import 'package:flutter/material.dart' hide CarouselController;

class EditProfileController extends ChangeNotifier {
  final _formKey = GlobalKey<FormState>();
  String? _fullName;
  String? _dateOfBirth;
  String _gender = "Male";
  String? _email;
  String? _phoneNumber;
  String? _location;

  EditProfileController();

  //public getters
  GlobalKey<FormState> get formKey => _formKey;
  String? get fullName => _fullName;
  String? get dateOfBirth => _dateOfBirth;
  String? get gender => _gender;
  String? get email => _email;
  String? get phoneNumber => _phoneNumber;
  String? get location => _location;

  void setFullName(String value) {
    _fullName = value;
    notifyListeners();
  }

  void setDateOfBirth(String value) {
    _dateOfBirth = value;
    notifyListeners();
  }

  void setGender(String? value) {
    _gender = value!;
    notifyListeners();
  }

  void setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void setPhoneNumber(String value) {
    _phoneNumber = value;
    notifyListeners();
  }

  void setLocation(String value) {
    _location = value;
    notifyListeners();
  }
}
