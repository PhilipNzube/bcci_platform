import 'package:bcci_platform/core/services/graphql_service.dart';
import 'package:bcci_platform/presentation/screens/main_app/main_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
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

  Future<void> submitForm(BuildContext context) async {
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();
    final String firstName = userNameController.text.trim();
    final String surname = userNameController.text.trim();
    final String otherNames = userNameController.text.trim();

    if (email.isEmpty ||
        password.isEmpty ||
        firstName.isEmpty ||
        surname.isEmpty) {
      CustomSnackbar.show(
        context,
        'All required fields must be filled.',
        isError: true,
      );
      return;
    }

    final RegExp emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    if (!emailRegex.hasMatch(email)) {
      CustomSnackbar.show(
        context,
        'Please enter a valid email address.',
        isError: true,
      );
      return;
    }

    if (password.length < 6) {
      CustomSnackbar.show(
        context,
        'Password must be at least 6 characters.',
        isError: true,
      );
      return;
    }

    _isLoading = true;
    notifyListeners();

    try {
      const String createUserMutation = r'''
      mutation CreateUser($user: UserInput!) {
        createUser(user: $user) {
          id
          firstName
          surname
          otherNames
          email
          roles
        }
      }
    ''';

      final Map<String, dynamic> variables = {
        "user": {
          "firstName": firstName,
          "surname": surname,
          "otherNames": otherNames,
          "email": email,
          "password": password,
          "roles": ["USER"],
        },
      };

      final QueryResult result = await GraphQLService.client.mutate(
        MutationOptions(
          document: gql(createUserMutation),
          variables: variables,
        ),
      );

      if (result.hasException) {
        print('GraphQL Exception: ${result.exception}');

        final String? errorMessage =
            result.exception?.graphqlErrors.isNotEmpty == true
            ? result.exception!.graphqlErrors.first.message
            : 'Registration failed. Please try again.';

        CustomSnackbar.show(context, errorMessage!, isError: true);
        return;
      }

      final user = result.data?['createUser'];
      print('Full response: ${result.data}');
      CustomSnackbar.show(
        context,
        'Welcome, ${user['firstName']}! Your account has been created.',
        isError: false,
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainApp(key: UniqueKey())),
      );
    } catch (e, stackTrace) {
      print('Unexpected error: $e');
      print('Stack trace: $stackTrace');
      CustomSnackbar.show(
        context,
        'Something went wrong. Please try again.',
        isError: true,
      );
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
