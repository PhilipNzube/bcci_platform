import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/widgets/custom_snackbar.dart';

class SignUpPageController extends ChangeNotifier {
  final FocusNode _userNameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _stateFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _retypePasswordFocusNode = FocusNode();

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _retypePasswordController =
      TextEditingController();
  final storage = const FlutterSecureStorage();
  late SharedPreferences prefs;
  bool _isLoading = false;
  bool _isPasswordVisible = false;
  bool _rememberMe = false;
  String _phoneNumber = '';

  SignUpPageController() {
    initialize();
  }

  //public getters
  bool get isLoading => _isLoading;
  bool get rememberMe => _rememberMe;
  String? get phoneNumber => _phoneNumber;

  TextEditingController get userNameController => _userNameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get stateController => _stateController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get retypePasswordController =>
      _retypePasswordController;

  FocusNode get userNameFocusNode => _userNameFocusNode;
  FocusNode get emailFocusNode => _emailFocusNode;
  FocusNode get stateFocusNode => _stateFocusNode;
  FocusNode get passwordFocusNode => _passwordFocusNode;
  FocusNode get retypePasswordFocusNode => _retypePasswordFocusNode;

  void setRememberMe(bool? value) {
    _rememberMe = value!;
    notifyListeners();
  }

  void setPhoneNumber(String value) {
    _phoneNumber = value;
    notifyListeners();
  }

  void initialize() {
    _initializePrefs();
  }

  Future<void> _initializePrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  // Future<void> submitForm(BuildContext context) async {
  //   if (prefs == null) {
  //     await _initializePrefs();
  //   }

  //   final String username = userNameController.text.trim();
  //   final String password = passwordController.text.trim();

  //   if (username.isEmpty || password.isEmpty) {
  //     CustomSnackbar.show(
  //       context,
  //       'All fields are required.',
  //       isError: true,
  //     );
  //     return;
  //   }

  //   // Validate password length
  //   if (password.length < 6) {
  //     CustomSnackbar.show(
  //       context,
  //       'Password must be at least 6 characters.',
  //       isError: true,
  //     );
  //     return;
  //   }

  //   _isLoading = true;
  //   notifyListeners();

  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => SelectCountry(
  //           key: UniqueKey(),
  //           onToggleDarkMode: onToggleDarkMode,
  //           isDarkMode: isDarkMode,
  //           username: username,
  //           password: password),
  //     ),
  //   );

  //   _isLoading = false;
  //   notifyListeners();
  // }
}
