import 'package:flutter/material.dart' hide CarouselController;

class SpiritualGoalsController extends ChangeNotifier {
  final _formKey = GlobalKey<FormState>();
  String _gender = "Male";

  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _dateOfBirth = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _address = TextEditingController();

  SpiritualGoalsController();

  //public getters
  String? get gender => _gender;

  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get fullName => _fullName;
  TextEditingController get dateOfBirth => _dateOfBirth;
  TextEditingController get email => _email;
  TextEditingController get phoneNumber => _phoneNumber;
  TextEditingController get address => _address;

  void setFullName(String value) {
    _fullName.text = value;
    notifyListeners();
  }

  void setGender(String? value) {
    _gender = value!;
    notifyListeners();
  }

  void setEmail(String value) {
    _email.text = value;
    notifyListeners();
  }

  void setPhoneNumber(String value) {
    _phoneNumber.text = value;
    notifyListeners();
  }

  void setAddress(String value) {
    _address.text = value;
    notifyListeners();
  }
}
