import 'dart:convert';

import 'package:bcci_platform/core/services/graphql_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

import '../../core/widgets/custom_snackbar.dart';
import '../screens/main_app/main_app.dart';
import '../screens/sign_in_page/widgets/dialogs/sign_in_error.dart';
import '../screens/sign_in_page/widgets/dialogs/prompt_user_for_permission.dart';

class SignInPageController extends ChangeNotifier {
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final storage = const FlutterSecureStorage();
  late SharedPreferences prefs;
  bool _isLoading = false;
  bool _isPasswordVisible = false;
  bool _rememberMe = false;
  bool isGoogleLoading = false;
  final _formKey = GlobalKey<FormState>();

  SignInPageController() {
    initialize();
  }

  //public getters
  bool get isLoading => _isLoading;
  bool get rememberMe => _rememberMe;
  GlobalKey<FormState> get formKey => _formKey;

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  FocusNode get emailFocusNode => _emailFocusNode;
  FocusNode get passwordFocusNode => _passwordFocusNode;

  // final GoogleSignIn signIn = GoogleSignIn.instance;

  // final List<String> scopes = <String>[
  //   'email',
  //   'profile',
  //   'https://www.googleapis.com/auth/user.gender.read',
  //   'https://www.googleapis.com/auth/user.birthday.read',
  // ];

  void setRememberMe(bool? value) {
    _rememberMe = value!;
    notifyListeners();
  }

  void setIsGoogleLoading(bool value) {
    isGoogleLoading = value;
    notifyListeners();
  }

  void initialize() {
    _initializePrefs();
  }

  Future<void> _initializePrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  void handlePermissionGranted(BuildContext context) {
    print('User granted permission.');
  }

  void handlePermissionDenied(BuildContext context) {
    print('User denied permission.');
  }

  Future<void> submitForm(BuildContext context) async {
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      CustomSnackbar.show(context, 'All fields are required.', isError: true);
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
      final String loginMutation = r'''
      mutation LoginUser($user: LoginUserInput!) {
        loginUser(user: $user) {
          message
        }
      }
    ''';

      final Map<String, dynamic> variables = {
        "user": {"email": email, "password": password},
      };

      final QueryResult result = await GraphQLService.client.mutate(
        MutationOptions(document: gql(loginMutation), variables: variables),
      );

      if (result.hasException) {
        print('GraphQL Exception: ${result.exception}');

        final String? errorMessage =
            result.exception?.graphqlErrors.isNotEmpty == true
            ? result.exception!.graphqlErrors.first.message
            : 'Login failed. Please check your credentials.';

        CustomSnackbar.show(context, errorMessage!, isError: true);
        return;
      }

      final String message =
          result.data?['loginUser']['message'] ?? 'Login successful!';
      print('Full response: ${result.data}');
      CustomSnackbar.show(context, message, isError: false);

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
